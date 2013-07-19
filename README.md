# zsh-custom
I am a fan of [ZSH](http://www.zsh.org/) and I use the configuration framework [Oh My ZSH](https://github.com/robbyrussell/oh-my-zsh) to customize it to my needs.

This is the `/custom` folder in my `~/.oh-my-zsh`. It contains my personal setup which works fine for me. It includes some personal configurations, so it is not made to be a template, but it may provide some re-usable ideas. However, I'm working on making this more generic by adding personal settings and configuration files.

## Setting up .zshrc

In your `~/.oh-my-zsh` directory, replace `custom` with the a clone of this repository.

  rm -r custom
  git clone git://github.com/indrode/zsh-custom.git custom

To keep all customized files within the repository, my `~/.zshrc` file looks like this:

  # HINT: type 'ohmyzsh' to edit shell config files
  . ~/.oh-my-zsh/custom/zshrc

Restart the shell and run `setup_zsh` to create the configuration file.

  exec $SHELL
  setup_zsh

## Available disk space

Add a `.hd` file to the root of the repository, which will be gitignored and holds the hard drive grep string, i.e. a string that identifies the desired hard drive in a `df` command. This is used to determine the free space in the custom terminal prompt.

## Notes

The default settings for Sublime Text 2 in `/settings` need to be moved to Sublime Text's `/Packages/Default` folder:

  ~/Library/Application Support/Sublime Text 2/Packages/Default

Read more about setting up Gmail-account checking in the `.settings` section: [https://github.com/indrode/zsh-custom/tree/master/.settings](https://github.com/indrode/zsh-custom/tree/master/.settings).

My personal zsh theme `indro` is kept in it's usual place in `~/.oh-my-zsh/themes` and is currently not checked into revision control.

If `ZSH` and `oh-my-zsh` are new to you, check out Ryan Bates' [Oh My ZSH screencast](http://railscasts.com/episodes/308-oh-my-zsh) for a short introduction and setup instructions.

## Updates

I have moved my custom prompt into this repository. You can view it [here](https://github.com/indrode/zsh-custom/blob/master/indro.zsh-theme).
