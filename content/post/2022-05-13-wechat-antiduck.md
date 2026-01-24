---
title: "Wechat AntiDuck"
date: 2022-05-13T13:30:58+02:00
tags:
    - "macOS"
---

There's this annoying feature on macOS that would lower the media volume when you are on a call or Facetime which appears in Wechat, Facetime or Skype. Basically, you can't listen to YT when you are on a call.

To avoid that, [Wechat-AntiDuck](https://github.com/icpz/WeChat-AntiDuck) comes to help.

## Fix "No permission to open"

```bash
sudo codesign --force --deep --sign - "/Applications/WeChat.app"
```

This doesn't work with the following warning.
```bash
/Applications/WeChat.app: the codesign_allocate helper tool cannot be found or used
```
Tried re-installing the homebrew version, no luck.
Tried installing the app store version, still no luck.

Tried following this guide: https://stackoverflow.com/questions/29848622/codesign-allocate-error-unable-to-find-utility-codesign-allocate-not-a-deve, still doesn't work

According to this [discussion](https://stackoverflow.com/questions/29848622/codesign-allocate-error-unable-to-find-utility-codesign-allocate-not-a-deve), I just copied the app to another folder, signed it and then replaced it with the one in `/Applications`

>It's a known bug in the codesign tool. To work around it, make a copy of your modified executable, sign the copy, then replace the original executable with the signed copy and it should work.

>For more details, see [here](https://github.com/Homebrew/brew/issues/9082).
