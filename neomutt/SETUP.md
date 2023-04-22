# Adding credentials

## Using `pass` with GMAIL

Generate a (app-specific password)[https://security.google.com/settings/security/apppasswords]. LEAVE IT UP!

Add that pass word to `apps/neomut/google`.

Create a file in this folder called `credentials`.

At the top of this file, put:

```
# User Info
set from = "<username>@gmail.com"
set realname = "<First> <Last>"

# Gmail
set imap_user ="<username>@gmail.com"
set smtp_url = "smtps://<username>@smtp.gmail.com:465/"
```

# Adding a signature

Create a file named `signature` in this folder.

Add your signature to it. EZ.

Example:

```
---
Beavis Martin --- Have a great day!
Web Developer @ Evil Corpo Ltd.
```

Uncomment the following in `options`:

```
# set signature = "$HOME/.config/neomutt/signature"
```
