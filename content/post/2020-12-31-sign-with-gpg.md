---
title: "Sign with GPG"
date: 2020-12-31T09:41:52+01:00
tags:
    - "git"
---

## Backup

1. Backup Public key to `public_key.asc`
    - See: https://gpgtools.tenderapp.com/kb/gpg-keychain-faq/backup-or-transfer-your-keys
2. Backup Secret key to `secret_key.gpg`
    - `gpg --export-secret-keys YOUR_ID_HERE > secret_key.gpg`
3. Backup `.gnupg/` just in case

gpg-agent.conf

```
default-cache-ttl 600
max-cache-ttl 7200
pinentry-program /usr/local/MacGPG2/libexec/pinentry-mac.app/Contents/MacOS/pinentry-mac
```

gpg.conf

```
auto-key-retrieve
no-emit-version
no-tty
default-key YOUR_ID_HERE
```

## Restore

After install gpg-suite, simply click the `public_key.asc` and 
`secret_key.gpg`, it will prompts for password for secret keys.

Simply copy conf files to `~/.gnupg`

## Motivation

Came across this signing in [dotfiles](https://github.com/alrra/dotfiles) and I would also want to have the verified in each commit I made in my pc so why not?

## How-to

1. Install [GPG Suite](https://gpgtools.org/) as it allows storing in macOS keychain, without typing each time
    * `brew install --cask gpg-suite`
    * Don't install `gpg` or `pinentry-mac` as it might cause conflict and also can not be stored in keychain
2. Create a key either from [CLI](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-gpg-key) or in GPG Keychain app
    * Noted the name and email should be the same as the git configure
3. Specify location for git
    * In `~/.gitconfig.local`: modify as below
4. [Adding a new GPG key to your GitHub account](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/adding-a-new-gpg-key-to-your-github-account)

```ini
[commit]

    # Sign commits using GPG.
    # https://help.github.com/articles/signing-commits-using-gpg/

    gpgsign = true


[user]

    name = 
    email = 
    signingkey = 
    # signkey
    # See https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/telling-git-about-your-signing-key

# Tell git about gpg path
# https://gist.github.com/danieleggert/b029d44d4a54b328c0bac65d46ba4c65
# https://github.com/pstadler/keybase-gpg-github
[gpg]
	program = /usr/local/MacGPG2/bin/gpg2
```

## Keep your email private

At this point, the emails I used have already been in so many projects and repo and its just a fact that this email is already "exposed".

You can check, see a [post](https://revoir.in/wiki/posts/git_custom_email_signed_commits/)

```shell
# You can clone any of your favorite repository/library

git clone https://github.com/stretchr/testify && cd testify
git log --format=email --abbrev-commit | grep -i mail | sort -u
```

The things and steps are pretty much just the same as the post but there's one thing worth mentioning.


In the email setting in Github, a masked email address will be generated with a format: `NUMBER+username@github.noreply.github.com`. But `username@github.noreply.github.com` is the one to input in GPG key, the one with a number prefix is not gonna verfy the commits and github will show errors like "No githuub user associated with the email"

[How to add email to gpg key](https://docs.github.com/en/authentication/managing-commit-signature-verification/associating-an-email-with-your-gpg-key)