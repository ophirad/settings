MAN_PATH = `printf $(manpath| awk -F':' '{print $1}')/man6`
MAN_PREFIX = "adi_"
MAN_SUFFIX = ".6"

namespace :man do
  desc "Remove all #{MAN_PREFIX} man pages from man_path and local directory"
  task :clear  do
    sh "sudo rm -f #{MAN_PATH}/#{MAN_PREFIX}*"
    sh "rm -f ./man/*.man"
  end

  desc "yum install txt2tags"
  task :install_txt2tags  do
    sh "sudo yum list -q installed txt2tags" do
      sh "sudo yum install -y -q ./man/txt2tags-2.6-1.el6.rf.noarch.rpm" unless  $?.success? 
    end
  end

  desc "copy man pages to #{MAN_PATH}"
  task :copy => [:clear, :txt2tags] do
    sh "for f in man/*.man;do sudo mv $f  #{MAN_PATH}/#{MAN_PREFIX}$(basename $f .man)#{MAN_SUFFIX}  ;done"
    sh "gzip #{MAN_PATH}/#{MAN_PREFIX}*"
  end

  desc "run txt2tags on ./man to create man pages"
  task :txt2tags => [:install_txt2tags] do
    sh "txt2tags -t man man/*.t2t"
  end

  desc "create all man pages and copy over"
  task :all => [:copy]  do
    # use 'locate adi_ | grep gz$' to find all my man pages
    sh "sudo updatedb" 
  end

end
