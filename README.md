# zsh-custom
I am a fan of [ZSH](http://www.zsh.org/) and I use the configuration framework [Oh My ZSH](https://github.com/robbyrussell/oh-my-zsh) to customize it to my needs.

This is the `/custom` folder in my `~/.oh-my-zsh`. It contains my personal setup which works fine for me. It includes some personal configurations, so it is not made to be a template, but it may provide some re-usable ideas.

## Setting up .zshrc

In your `~/.oh-my-zsh` directory, replace `custom` with the a clone of this repository.

	rm custom
	git clone git@github.com:indrode/zsh-custom.git custom

To keep all customized files within the repository, my `~/.zshrc` file looks like this:

	# HINT: type 'ohmyzsh' to edit shell config files
	. ~/.oh-my-zsh/custom/zshrc

You can enable certain features, by placing certain `.setting` files in your `custom/.settings` directory, e.g.

	ENABLE_SWAP.setting
	CHECK_MAIL.setting

## Dependencies

My setup includes some gimmicks that require `figlet` which can be installed via `Fink`, a package manager for OS X. To install Fink, follow the [Fink instructions](http://www.finkproject.org/download/srcdist.php). Once Fink is installed and package description files and patches are installed, install `figlet`.

	fink install figlet
	
## Available disk space

Add a `.hd` file to the root of the repository, which will be gitignored and holds the hard drive grep string, i.e. a string that identifies the desired hard drive in a `df` command. This is used to determine the free space in the custom terminal prompt.

## Notes

The default settings for Sublime Text 2 in `/settings` need to be moved to Sublime Text's `/Packages/Default` folder:

    ~/Library/Application Support/Sublime Text 2/Packages/Default

To get the `gmail` command work without having to enter your password manually each time, create a hidden file (e.g. `.personal`) in the `/custom` folder that includes your Gmail password (and nothing else). Now, you can run `gmail personal`. This allows you to create unlimited Gmail accounts.

My personal zsh theme `indro` is kept in it's usual place in `~/.oh-my-zsh/themes` and is currently not checked into revision control.

If `ZSH` and `oh-my-zsh` are new to you, check out Ryan Bates' [Oh My ZSH screencast](http://railscasts.com/episodes/308-oh-my-zsh) for a short introduction and setup instructions.

## Updates

I have moved my custom prompt into this repository. You can view it [here](https://github.com/indrode/zsh-custom/blob/master/indro.zsh-theme).
