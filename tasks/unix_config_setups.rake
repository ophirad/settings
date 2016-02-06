namespace :setup do
  desc "setting up default bashrc"
  task :bashrc  do
    sh "cp -b ./unix/bash_aliases ~/.bash_aliases"
    sh "cp -b ./unix/bash_functions ~/.bash_functions"
    sh "cp -b ./unix/bashrc_default ~/.bashrc"
    sh "cp -b ./unix/bash_profile_default ~/.bash_profile"
  end

  desc "setting up default ackrc"
  task :ackrc  do
    sh "cp -b ./unix/ackrc_default ~/.ackrc"
  end

  desc "setting up default colordiffrc"
  task :colordiffrc  do
    sh "cp -b ./unix/colordiffrc_default ~/.colordiffrc"
  end

  desc "setting up default vimrc"
  task :vimrc  do
    sh "cp -b ./vim/vimrc.default ~/.vimrc"

    # Install the vndle vim package manager
    sh "rm -rf  ~/.vim/bundle/Vundle.vim; mkdir -p  ~/.vim/bundle ; git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim"

    # JSHint 2 linter
    sh "rm -rf  ~/.vim/bundle/jshint2.vim; git clone https://github.com/Shutnik/jshint2.vim.git  ~/.vim/bundle/jshint2.vim/" 

    # install all Vundle based plugins
    sh "vim +PluginInstall +qall"
  end

  desc "augment ~/.bash_history with saved history files"
  task :history  do
    sh "cat history/*.history > ~/.useful_history"
  end

  desc "overwrite hgrc config file"
  task :hg_config  do
    sh "sudo cp -f hg/hgrc_default .hg/hgrc"
  end

  desc "setting up all default configs"
  task :all => [:vimrc, :bashrc, :history, :hg_config, :ackrc, :colordiffrc]  do
  end

end
