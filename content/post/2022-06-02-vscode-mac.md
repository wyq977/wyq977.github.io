---
title: "VSCode LaTex Mac"
date: 2022-06-02T15:32:31+03:00
tags:
    - "macOS"
---

## Using Latex on macOS

Download MacTex (~3/4 GB with most packages included), via homebrew, support for Apple Silicon

## Guide

I followed mostly [VSCODE CONFIG LATEX (MAC)](http://homepages.rpi.edu/home/36/wangy52/public_html/PersonalWebsite/build/html/Misc/Mac/VSCode/VSCode-LaTeX.html), which is quite comprehensive and easy to follow.

The only adjustment I need is the directory for skim location `/opt/homebrew/bin/` if installed via homebrew.

Also don't delete `syntex.gz` file as it's required for bi-directional jumping between VSCode and Skim.


```json
    // latex
    "latex-workshop.view.pdf.viewer": "external",
    "latex-workshop.view.pdf.external.viewer.command": "/opt/homebrew/bin/displayline",
    "latex-workshop.view.pdf.external.viewer.args": [
        "0",
        "%PDF%"
    ],
    "latex-workshop.view.pdf.external.synctex.command": "/opt/homebrew/bin/displayline",
    "latex-workshop.view.pdf.external.synctex.args": [
        "-r",
        "%LINE%",
        "%PDF%",
        "%TEX%"
    ],
    "latex-workshop.latex.clean.fileTypes": [
        "*.aux",
        "*.bbl",
        "*.blg",
        "*.idx",
        "*.ind",
        "*.lof",
        "*.lot",
        "*.out",
        "*.toc",
        "*.acn",
        "*.acr",
        "*.alg",
        "*.glg",
        "*.glo",
        "*.gls",
        "*.ist",
        "*.fls",
        "*.log",
        "*.fdb_latexmk",
        "*.snm",
        "*.nav"
    ],
```

