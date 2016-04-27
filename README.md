This script is used to initialize new yum based VMs to contain tools of your choice.
Can be done via salt/chef or a preset image.  However, when using many tmp VMs (or building an image VM) this is a simpler, shorter and handier option.

Auto-run:
# install git, clone the git repo and run the bootstrap script
sudo sh -c "yum install -y -q git && git clone https://github.com/ophirad/settings.git /tmp/adi_bootstrap && sleep 1";  pushd /tmp/adi_bootstrap && . bootstrap.sh && popd
