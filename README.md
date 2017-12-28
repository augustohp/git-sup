# git-sup [![Build Status](https://travis-ci.org/augustohp/git-sup.svg)](https://travis-ci.org/augustohp/git-sup)

Have a directory with multiple Git repositories and want easily retrieve updates
from different remotes? Ask git "Whats up!?"

	$ cd ~/src/github.com/Respect
	$ git sup fetch .
	/Users/apascutti/src/github.com/Respect/Rest
		Fetching origin
		c0c7022..a37067a  master     -> origin/master
	/Users/apascutti/src/github.com/Respect/Template
		Fetching origin
	/Users/apascutti/src/github.com/Respect/Validation
		Fetching upstream
		Fetching origin

This will fetch updates from all remotes inside that directory.

## Installation

One-liner using Sinister:

	$ sh <(curl -sSL http://git.io/sinister) --local --url https://git.io/git-sup

Or you can clone the project where you want to, all you need after is to sym
link the git-pair script to your `$PATH`:

	$ cd <my-src-dir>
	$ git clone http://github.com/augustohp/git-sup
	$ chmod a+x git-sup/git-sip
	$ ln -s <my-src-dir>/git-sup /usr/local/bin

Now you should be able to execute `git sup` anywhere.

## Configuration

You can use `.git/config` or `~/.gitconfig` to configure `git-sup`:

	[sup]
		fetchargs = --prune

Git configuration is respected. If you have a global configuration it is used
when no local configuration is found. If you have an specific configuration for
that repository, than the local configuration is preferred.
