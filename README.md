
# Simple Presentations in Docker

[sent](https://tools.suckless.org/sent/)  | software that sucks less

* Roboto Font
* Noto Emoji Font `NOTE:` SVG/Color fonts are not supported by `sent`
* Everything you need in only 16mb <img src="./resources/sir.png" alt="sir" height="15">
* No more need for clunky software like Powerpoint.
* Write presentations in plaintext.
* Forces you to use [Takahashi Method](https://en.wikipedia.org/wiki/Takahashi_method) forcing your presentations to be simple and higher quality.
* includes progress-bar and command-line options patches
* Dockerize all the things <img src="./resources/allthethings.png" alt="allthethings" height="15">

## Requirements

* X11 Window Server

### MacOSX

[Download XQuartz](https://www.xquartz.org/releases/index.html)

Open XQuartz

```bash
open -a XQuartz
```

In the XQuartz preferences, go to the “Security” tab and make sure you’ve got 'Allow connections from network clients' ticked

Run xhost and allow connections from your local machine:

```bash
xhost + 127.0.0.1
```

### Windows

You'll need a X Window server, I recommend looking up `gui apps docker windows`. The DSIPLAY variable is set to the host machine's IP address already. Changing it is simple by adding `-e DISPLAY=$MYIP` on docker run.

### Linux

```
docker run -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY richjs/sent
```

## Example Presentation

```bash
docker run richjs/sent
```

## Custom Presentation

First make a new directory somewhere on your machine and create a file following sent's instructions [here](https://tools.suckless.org/sent/) or check out the example file in this repo under the example directory

```bash
docker run -v $MY_PRESENTATION_DIR:/opt/sent richjs/sent filename
```

## Arguments

```
# usage: sent [-c fgcolor] [-b bgcolor] [-f font] [file]
docker run richjs/sent -f roboto -b \#ffffff -c \#fb3300 ./example
```

### Docker FTW!

<img src="./resources/leftshark-dance.gif" alt="sharkdance">
