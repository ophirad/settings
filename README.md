Auto-run:
# install mercurial, clone the hg repo and run the bootstrap script
sudo sh -c "yum install -y -q hg && hg clone https://eddiegold@bitbucket.org/eddiegold/settings /tmp/adi_bootstrap && sleep 1";  pushd /tmp/adi_bootstrap && . bootstrap.sh && popd
