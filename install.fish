set NVM_TARGET "$HOME/.nvm"

if test -d $NVM_TARGET
  echo "=> NVM is already installed in $NVM_TARGET, trying to update"
  echo -n "=> "
  cd $NVM_TARGET; and git pull
  exit
end

# Cloning to $NVM_TARGET
git clone git://github.com/burkostya/nvm.git $NVM_TARGET

echo 

# Detect profile file, .config/fish/config.fish has precedence over etc/fish/config.fish
if not test -z $argv[1]
  set PROFILE $argv[1]
else

  if test -f "$HOME/.config/fish/config.fish"
	  set PROFILE "$HOME/.config/fish/config.fish"
  else if test -f "$HOME/etc/fish/config.fish"
	  set PROFILE "$HOME/etc/fish/config.fish"
  end
end

set SOURCE_STR 'test -s "$HOME/.nvm/nvm.sh"; and . "$HOME/.nvm/nvm.sh"  # This loads NVM'

if test -z $PROFILE 
  echo "=> Profile $PROFILE not found"
  exit
else if not test -f $PROFILE
  echo "=> Append the following line to the correct file yourself"
  echo
  echo \t"$SOURCE_STR"
  echo  
  echo "=> Close and reopen your terminal to start using NVM"
  exit
end

if not grep -qc 'nvm.sh' $PROFILE
  echo "=> Appending source string to $PROFILE"
  echo $SOURCE_STR >> $PROFILE
else
  echo "=> Source string already in $PROFILE"
end

echo "=> Close and reopen your terminal to start using NVM"
