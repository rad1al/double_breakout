# double breakout

[![License: GPL v2](https://img.shields.io/badge/License-GPL%20v2-blue.svg)](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html)

#### (Work in progress)

An implemention and variation of a classic game done in Processing 3.

#### To play:

- In the browser: [click here](https://rad1al.github.io/double_breakout.html "double_breakout")
- On the desktop: clone the directory and run with Processing 3.3.5 or later.

#### Issues:

**Key Repeat on macOS Sierra**

When holding down keyboard keys on macOS Sierra to move the paddle, they may become unresponsive due to how Apple changed how key repeat works. To fix this, you'll have to enter the following in Applications → Utilities → Terminal:

```Bash
defaults write -g ApplePressAndHoldEnabled -bool false 
```

Then restart the application after using the command - this should resolve the issue.

To bring back the old behavior:

Enter the following command in Applications → Utilities → Terminal::

```
defaults write -g ApplePressAndHoldEnabled -bool false 
```
