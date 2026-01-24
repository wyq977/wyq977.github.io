---
title: "Python: Linter, LSP and Formatter"
date: 2025-11-10T11:29:26+01:00
tags:
    - "python"
    - "coding"
---

## What are necessary for good py code?

The ultimate reason why someone is using a formatter, linter is to avoid bugs in writing, format the code for better readability.

Wait, what are the tools required?

* Language Server Protocol (LSP): I understand it as tool that highlight/color the code
* Linter: Checks for errors
* Formatter: Change spaces to tabs, keep style...

## Problem: I use different editor

It wouldn't so anooying if I only use vscode, nvim or sublime.
But the problem is that I use a few editor and likely will try some more in the future.
How to make sure they are using the

Right now, the pylsp plugin in Sublime is very strict: even hightlights the trailing spaces behind each line.
And it also warns about 79 limit.

In the meantime, the pylance in vscodium is not.

Also, I am not sure if i am the vim I used has any LSP, linter for python installed or not.

```
VIM - Vi IMproved 9.1 (2024 Jan 02, compiled Jul 20 2025 20:30:35)
```

## Current setup

* installation: macOS, brew, venv, conda
* formatter: brew, vscodium extension, sublime inhouse
* linter: pylint?
* LSP: pyright? where is it installed?

Settings: Globally defined python coding style and project-wise style.
