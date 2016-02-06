GEM_CMD = "sudo gem install --no-rdoc --no-ri"
namespace :ruby do

  desc "Installing basic gems"
  task :basic do
    sh "#{GEM_CMD} json rspec curb pry"
  end

  desc "Installing development gems"
  task :dev do
    sh "#{GEM_CMD} ruby-lint configulations kubeclient activerecord pry-theme"
  end

  desc "install all gems"
  task :all => [:basic, :dev] do
  end

end
