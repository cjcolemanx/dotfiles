#! /bin/bash
curStat=$(playerctl shuffle)

if [ $curStat = On ]; then
  playerctl shuffle Off
else
  playerctl shuffle On
fi
