echo
echo "  >>> Installing Ruby and rake"
sudo yum install ruby git -y -q
sudo gem install -q rake
sleep 3

echo
echo "  >>> configuration (.bashrc, vimrc ...)"
/usr/local/bin/rake setup:all

echo
echo "  >>> sourcing ~/.bashrc"
source ~/.bashrc

echo
echo "  >>> sourcing history"
source ~/.useful_history

echo
echo "  >>> installing basic yum repos"
/usr/local/bin/rake yum:minimal

echo
echo "  >>> installing man pages"
/usr/local/bin/rake man:all 
