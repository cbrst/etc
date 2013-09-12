# easy way to get currently used font. pipe to xclip for max satisfaction!
xfont() { xrdb -query | grep font | head -1 | cut -f 2 }

# cd with ls
cdl() { cd $1; ls }

# take, upload and delete scrot
tud() { scrot ${1}.png; fb ${1}.png; rm ${1}.png }
tuds() { scrot -s ${1}.png; fb ${1}.png; rm ${1}.png }
