#!/bin/bash

ID=`echo $1 | cut -d, -f2 | cut -d- -f2`
Nazwa=`echo $1 | cut -d, -f3 | sed s/-/./g`

wget --user-agent="Mozilla/5.0 (X11; U; Linux x86_64; pl-PL) AppleWebKit/532.0 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/549.0" --referer="http://reseton.pl/static/player/v612/jwplayer.flash.swf" -c "http://stream.freedisc.pl/video/$ID/$Nazwa"
