---
title: "Download Tencent Videos"
date: 2020-12-18T18:29:33+01:00
tags:
    - download
---

Mostly based on [流水账：如何使用 annie 批量下载优酷 VIP 视频](https://meta.appinn.net/t/topic/13946)

using [annie](https://github.com/iawia002/annie), [ffmpeg](https://ffmpeg.org/)

Both of them can be installed on macOS via homebrew

```bash
brew install annie
brew install ffmpeg
```

## Get cookies

* In console (Dev. Tools): `document.cookie`
* Or you can use EditThisCookie to get cookie of a vip account

## Get url

Copy each episode or follow the guide, grap href using online tools:http://tools.buzzstream.com/link-building-extract-urls

It might be easier for a few episodes to just copy and paste

## Download

```bash
# check info
annie -i -f fhd -c qqvip.txt -F s01.csv
# download fhd if present
annie -f fhd -c qqvip.txt -F s01.csv
```

## Extra

Most of the time is from connection and the actual download time is quite fast.