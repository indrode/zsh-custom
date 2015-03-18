# User-specific settings

Adjust your settings files (in `.settings/`) to customize your personal ZSH configuration. The following setting files are currently supported:

    config
    intro

## Config

This is the default `config` file that is generating when running `setup-zsh`.

The `ZSH_THEME` settings sets the theme to be used:

    # name of the zsh theme to be used
    export ZSH_THEME="indro"

Specify the text editor you want to use:

    # your preferred text editor, e.g. mate, subl, vim, nano
    export EDITOR=subl

Three different Ruby version managers are supported. Specify the one you use:

    # name of ruby manager, e.g. chruby, rbenv
    export RUBY_MANAGER='chruby'

In the `indro` shell prompt, the amount of free disk space of one hard drive is displayed. With this setting you can chose, which hard drive you want to use:

    # hard drive used prompt
    export MAIN_HD='/dev/disk1'


## Intro

On each session start, the content of the `intro` file is displayed in the shell. Use this for specifying a welcome message, some ascii art maybe, or anything else.
