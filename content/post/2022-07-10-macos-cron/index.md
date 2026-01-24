---
title: "CRON Jobs for macOS"
date: 2022-07-10T23:05:21+02:00
tags:
    - "macOS"
---

## CRONTAB on macOS

It's annoying on macOS that each editing would prompt the pop up for authorization of scheduled task.

## .plist What is it?

To load/unload a plist
```shell
launchctl load ~/Library/LaunchAgents/test.plist
launchctl unload ~/Library/LaunchAgents/test.plist
```

Due to the limitations of recent macOS updates, it's getting increasingly difficult to run a small command via shell, which is totally understandable at a security standpoint.

Therefore, we need to use the Automator.app from Apple to essentially run any scripts (fixed) daily.

Example.plist which runs daily at 09:27

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>test.label</string>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/bin/open</string>
        <string>-a</string>
        <string>/Applications/Backup Brewfile.app</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>StartCalendarInterval</key>
    <dict>
        <key>Hour</key>
        <integer>09</integer>
        <key>Minute</key>
        <integer>27</integer>
    </dict>
</dict>
</plist>
```

Example app

![](brew-update-automator.png)

Ref:

* [launchd plist format for running a command at a specific time on a weekday - Ask Different](https://apple.stackexchange.com/questions/249446/launchd-plist-format-for-running-a-command-at-a-specific-time-on-a-weekday)
* [Macos – How to get a script to run every day on Mac OS X – Unix Server Solutions](https://super-unix.com/superuser/how-to-get-a-script-to-run-every-day-on-mac-os-x/)
* [launchagents.md - awesome-macos-command-line - Use your macOS terminal shell to do awesome things.](https://git.herrbischoff.com/awesome-macos-command-line/tree/launchagents.md)
