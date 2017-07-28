#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

# This command will inherit your X client configuration from the default
# Note: .XResources is your client config file, as opposed to .xserverrc
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Start ssh-agent
eval $(ssh-agent)

# Set background image with feh
feh --bg-scale ~/pics/sunset.jpg &

# Reduce brightness to avoid display looking washed out
xrandr --output HDMI-0 --brightness 0.81

# Start xbindkeys and screensaver
xbindkeys
# xscreensaver -no-splash & # Currently this resets xrandr settings

# The exec command does not fork
exec xmonad

