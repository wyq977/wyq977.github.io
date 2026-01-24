---
title: "Filter on a per-app basis on iOS"
date: 2022-06-07T16:50:18+03:00
tags:
    - VPN
    - "iOS"
---

## Trouble with VPN (Loon)

Though the filter rule support local and self-defined resource parser, GeoIP resolver, etc. 
I still came across many times where I had trouble with Loon enabled.

This is one of easiest case involved, I would like certain app to follow certain policy,
such as `REJECT`, `DIRECT` or `proxy (added)`.

It can be achieved as followed, where all the traffic via Facebook app will be blocked.

```
[Rule]
USER-AGENT,com.facebook.Facebook,REJECT
```

Examples can be found here: https://github.com/blackmatrix7/ios_rule_script/blob/master/rule/Loon/Apple/Apple.list

## [How to Find Bundle ID of an iOS app ? Step by Step - Mr. Virk Media](https://mrvirk.com/how-to-find-app-bundle-id-ios.html)

Get the text file from url with ID, Example: https://itunes.apple.com/lookup?id=304158842&country=us

Find the `bundleId`