# Node Version Manager

## Installation

**Fish version is broken for now. NOT works:**

* nvm copy-packages <version>
* nvm clear-cache

First you'll need to make sure your system has a c++ compiler.  For OSX, XCode will work, for Ubuntu, the build-essential and libssl-dev packages work.

### Install script

To install you could use the [install script](https://github.com/creationix/nvm/blob/master/install.sh)([fish version](https://github.com/burkostya/nvm/blob/master/install.fish)) (requires Git) using cURL:

    curl https://raw.github.com/creationix/nvm/master/install.sh | sh

for fish:

    curl https://raw.github.com/burkostya/nvm/master/install.fish | fish

or Wget:

    wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | sh
    
for fish

    wget -qO- https://raw.github.com/burkostya/nvm/master/install.fish | fish

<sub>The script clones the Nvm repository to `~/.nvm` and adds the source line to your profile (`~/.bash_profile` or `~/.profile` or `~/.config/fish/config.fish`).</sub>


### Manual install

For manual install create a folder somewhere in your filesystem with the "`nvm.sh`"("`nvm.fish`") file inside it.  I put mine in a folder called "`nvm`".

Or if you have `git` installed, then just clone it:

    git clone git://github.com/creationix/nvm.git ~/nvm

To activate nvm, you need to source it from your bash shell

    . ~/nvm/nvm.sh
    
Or for fish shell
    
    test -s ~/.nvm/nvm.fish; and . ~/.nvm/nvm.fish

I always add this line to my `~/.bashrc` or `~/.profile` (`~/.config/fish/config.fish` for fish) file to have it automatically sources upon login.   
Often I also put in a line to use a specific version of node.
    
## Usage

To download, compile, and install the v0.6.14 release of node, do this:

    nvm install 0.6.14

And then in any new shell just use the installed version:

    nvm use 0.6.14
    
Or you can just run it:

    nvm run 0.6.14
    
If you want to see what versions are available:

    nvm ls
    
To restore your PATH, you can deactivate it.

    nvm deactivate
    
To set a default Node version to be used in any new shell, use the alias 'default':

    nvm alias default 0.6
    
## License

Nvm is released under the MIT license.


Copyright (C) 2010-2012 Tim Caswell

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Running tests
Tests are written in [Urchin](http://www.urchin.sh). Install Urchin like so.

    wget -O /usr/local/bin https://raw.github.com/scraperwiki/urchin/0c6837cfbdd0963903bf0463b05160c2aecc22ef/urchin
    chmod +x /usr/local/bin/urchin

(Or put it some other place in your PATH.)

There are slow tests and fast tests. The slow tests do things like install node
and check that the right versions are used. The fast tests fake this to test
things like aliases and uninstalling. From the root of the nvm git repository,
run the fast tests like this.

    urchin test/fast

Run the slow tests like this.

    urchin test/slow

Run all of the tests like this

    urchin test

Nota bene: Avoid running nvm while the tests are running.

## Bash completion

To activate, you need to source `bash_completion`:

  	[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

Put the above sourcing line just below the sourcing line for NVM in your profile (`.bashrc`, `.bash_profile`).

### Usage

nvm

	$ nvm [tab][tab]
	alias          copy-packages  help           list           run            uninstall      version        
	clear-cache    deactivate     install        ls             unalias        use

nvm alias

	$ nvm alias [tab][tab]
	default

	$ nvm alias my_alias [tab][tab]
	v0.4.11        v0.4.12       v0.6.14
	
nvm use

	$ nvm use [tab][tab]
	my_alias        default        v0.4.11        v0.4.12       v0.6.14
	
nvm uninstall

	$ nvm uninstall [tab][tab]
	my_alias        default        v0.4.11        v0.4.12       v0.6.14
	
## Problems

If you try to install a node version and the installation fails, be sure to delete the node downloads from src (~/nvm/src/) or you might get an error when trying to reinstall them again or you might get an error like the following:
    
    curl: (33) HTTP server doesn't seem to support byte ranges. Cannot resume.

Where's my 'sudo node'? Checkout this link:
    
https://github.com/creationix/nvm/issues/43

on Arch Linux and other systems using python3 by default, before running *install* you need to

      export PYTHON=python2

