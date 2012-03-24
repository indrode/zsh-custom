# zsh-custom
I am a fan of [ZSH](http://www.zsh.org/) and I use the configuration framework [Oh My ZSH](https://github.com/robbyrussell/oh-my-zsh) to customize it to my needs.

This is the `/custom` folder in my `~/.oh-my-zsh`. It contains my personal setup which works fine for me. It includes some personal configurations, so it is not made to be a template, but it may provide some re-usable ideas.

## Setting up .zshrc

To keep all customized files within the repository, my `~/.zshrc` file looks like this:

	# HINT: type 'ohmyzsh' to edit shell config files
	. ~/.oh-my-zsh/custom/zshrc

## Dependencies

My setup includes some gimmicks that require `figlet` which can be installed via `Fink`, a package manager for OS X. To install Fink, follow the [Fink instructions](http://www.finkproject.org/download/srcdist.php). Once Fink is installed and package description files and patches are installed, install `figlet`.

	fink install figlet

## Notes

To get the `gmail` command work without having to enter your password manually each time, create a hidden file (e.g. `.personal`) in the `/custom` folder that includes your Gmail password (and nothing else). Now, you can run `gmail personal`. This allows you to create unlimited Gmail accounts.

My personal zsh theme `indro` is kept in it's usual place in `~/.oh-my-zsh/themes` and is currently not checked into revision control.

If `ZSH` and `oh-my-zsh` are new to you, check out Ryan Bates' [Oh My ZSH screencast](http://railscasts.com/episodes/308-oh-my-zsh) for a short introduction and setup instructions.

## Updates

I have moved my custom prompt into this repository. You can view it [here](https://github.com/indrode/zsh-custom/blob/master/indro.zsh-theme).