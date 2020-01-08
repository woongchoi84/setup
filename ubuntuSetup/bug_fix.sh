#! /bin/bash
# ==================================================
#  firefox downgrade
# ==================================================
# [Make Backup File]
wget -O ~/firefox.tar.bz2 "https://ftp.mozilla.org/pub/firefox/releases/69.0/linux-x86_64/en-US/firefox-69.0.tar.bz2"
sudo tar xjf ~/firefox.tar.bz2 -C /opt/
sudo mv /usr/lib/firefox/firefox /usr/lib/firefox/firefox_bug
sudo ln -s /opt/firefox/firefox /usr/lib/firefox/firefox
rm ~/firefox.tar.bz2

# [Completed Message]
echo "=================================================="
echo " firefox (69.0) has been installed"
echo "=================================================="
