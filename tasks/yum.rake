namespace :yum do

  desc "yum update machine"
  task :update do
    sh "#{YUM_CMD} epel-release"
    sh "sudo yum update -y -q"
  end

  desc "yum install locate+vim, curl+wget"
  task :basic do
    sh "#{YUM_CMD} mlocate vim-enhanced wget curl man"
    sh "sudo updatedb"
  end

  desc "yum install databases, postgrs+sqlite"
  task :db do
    sh "#{YUM_CMD} postgresql-devel postgresql-server sqlite"
  end

  desc "yum install make gcc..."
  task :dev do
    sh "#{YUM_CMD}  gcc g++ make automake autoconf curl-devel openssl-devel zlib-devel httpd-devel apr-devel apr-util-devel sqlite-devel ruby-devel"

    #sh "#{YUM_CMD} http://mirror.centos.org/centos/7/os/x86_64/Packages/ruby-devel-2.0.0.598-24.el7.x86_64.rpm "
  end

  desc "yum install vcs, hg + git"
  task :vcs do
    sh "#{YUM_CMD} git tig hg"
  end

  desc "yum install debug tools: nmap (netcat) and bind-utils (dig), netstat (net-tools), tcpdump, lsof, strace, fuser(psmisc), mtr (tracert+ping)"
  task :network do
    sh "#{YUM_CMD} nmap bind-utils net-tools tcpdump lsof strace psmisc mtr"
  end

  desc "yum install utilities: jq, ack"
  task :utils do
    sh "#{YUM_CMD} jq ack deltarpm"
  end

  desc "yum update, install basic + utils"
  task :minimal => [:basic, :utils] do
  end

  desc "yum install all"
  task :all => [:update, :basic, :db, :dev, :vcs, :utils] do
  end

end
