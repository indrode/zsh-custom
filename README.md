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

## Personal settings

Adjust the settings in `settings/config` to your liking.

    # name of the zsh theme to be used
    export ZSH_THEME="indro"

    # your preferred text editor, e.g. mate, subl, vim, nano
    export EDITOR=subl

    # name of ruby manager, e.g. chruby, rbenv
    export RUBY_MANAGER='chruby'

    # hard drive used prompt
    export MAIN_HD='/dev/disk1'

Refer to [https://github.com/indrode/zsh-custom/tree/master/settings](https://github.com/indrode/zsh-custom/tree/master/settings) for more detailed explanations regarding settings.

## The shell prompt

This setup uses my custom prompt. You can view it [here](https://github.com/indrode/zsh-custom/blob/master/indro.zsh-theme). Adjust the setting to use a different prompt.

## Contributing

1. Fork it ( https://github.com/indrode/zsh-custom/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
