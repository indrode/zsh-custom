# zsh-custom

I like [ZSH](http://www.zsh.org/) and I use the configuration framework [Oh My ZSH](https://github.com/robbyrussell/oh-my-zsh) to add more functionality. Additionally, I have added a lot more customization in recent years.

If `ZSH` and `oh-my-zsh` are new to you, check out Ryan Bates' [Oh My ZSH screencast](http://railscasts.com/episodes/308-oh-my-zsh) for a short introduction and setup instructions.

This is the `/custom` folder in my `~/.oh-my-zsh`. It contains my personal setup which works fine for me. It includes some personal configurations, so it is not made to be a template, but it may provide some re-usable ideas. I'm working on making this more generic by adding personal settings and configuration files.

## Setting up .zshrc

This assumes that you have a working [Oh My ZSH](https://github.com/robbyrussell/oh-my-zsh). In your `~/.oh-my-zsh` directory, replace `custom` with the git clone of this repository.

    ~/.oh-my-zsh
    rm -r custo
    git clone git://github.com/indrode/zsh-custom.git custom

Next, replace your `~/.zshrc` with a symlink to `~/.oh-my-zsh/custom/zshrc`. You may want to make a backup of your `~/.zshrc` if you desire.

    rm ~/.zshrc && ln -s ~/.oh-my-zsh/custom/zshrc ~/.zshrc

Restart the shell and run `setup-zsh` to create the configuration file.

    exec $SHELL
    setup-zsh

## Available disk space

Adjust the MAIN_HD variable in .settings/CONFIG.setting to hold the hard drive grep string, i.e. a string that identifies the desired hard drive in a `df` command. This is used to determine the free space in the custom terminal prompt.

## Prompt

This setup uses my custom prompt. You can view it [here](https://github.com/indrode/zsh-custom/blob/master/indro.zsh-theme).
