#!/bin/bash
cd ~/Изображения/Wallpapers
wget -O 123.jpg 'https://yandex.ru/images/today'
mv 123.jpg Yandex-Images-$(date +%Y-%m-%d).jpg
ls >> ~/.ewYI
x=1
f=0
FILE=~/.ewYI
echo "<background>
  <starttime>
    <year>$(date +%Y)</year>
    <month>01</month>
    <day>01</day>
    <hour>00</hour>
    <minute>00</minute>
    <second>00</second>
  </starttime>
<!-- This animation will start at midnight. -->" >> ~/precise.xml
while read line; do
	if (($x>1));then
		echo "	<to>/home/eli/Изображения/Wallpapers/$line</to>
  </transition>"
	else
		f=$line
	fi
    echo "<static>
    <duration>60.0</duration>
    <file>/home/eli/Изображения/Wallpapers/$line</file>
  </static>
  <transition>
    <duration>2.0</duration>
    <from>/home/eli/Изображения/Wallpapers/$line</from>"
    x=$(( $x + 1 ))
done < $FILE >> ~/precise.xml
echo "	<to>/home/eli/Изображения/Wallpapers/$f</to>
  </transition>
</background>" >> ~/precise.xml
mv ~/precise.xml /usr/share/backgrounds/contest/precise.xml

