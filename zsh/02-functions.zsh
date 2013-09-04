# easy way to get currently used font. pipe to xclip for max satisfaction!
xfont() { xrdb -query | grep font | head -1 | cut -f 2 }

# too lazy to emerge sudo...
sudo() { su -c "$@" }

# cd with ls
cdl() { cd $1; ls }