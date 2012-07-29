# User-specific settings

Add your settings (*.setting) files here (in `.settings/`)to customize your personal ZSH configuration. The following settings are supported:

    CHECK_MAIL.setting
    .*.email.setting
    INTRO.setting

## CHECK_MAIL

To get the `gmail` command work without having to enter your password manually each time, create a hidden file `.gmail.email.setting`) in the `/custom` folder that includes your Gmail password (and nothing else). Now, you can run `gmail gmail`. This allows you to create unlimited Gmail accounts. Note that you can create files for any Gmail-hosted accounts. Just name the hidden setting file acording to the Gmail-enabled domain (without TLD).

This option is only available if the `CHECK_MAIL.setting` exists in this folder.

    touch .settings/CHECK_MAIL.setting

## INTRO

On each session start, the contents of the `INTRO.setting` files are displayed in the shell. Use this for specifying a welcome message, some ascii art maybe, or anything else.