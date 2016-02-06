NPM_INSTALL = "npm install -g"

namespace :node do

  desc "install npm_modules for unit testing"
  task :node_testing => [:npm] do
    sh "#{NPM_INSTALL} mocha blanket jshint"
  end

  desc "install npm_dev packages"
  task :npm_dev => [:npm] do
    sh "#{NPM_INSTALL} express gulp grunt gulp-concat gulp-uglify lodash async"
  end

  desc "install npm_utilities packages"
  task :npm_utils => [:npm] do
    sh "#{NPM_INSTALL} URIjs elasticsearchclient"
  end

  desc "install npm"
  task :npm => [:nodejs]  do
    sh "#{YUM_CMD} npm"
  end

  desc "install nodejs"
  task :nodejs do
    sh "#{YUM_CMD} nodejs"
  end

  desc "install all npm modules"
  task :all => [:nodejs, :npm, :npm_utils, :node_testing, :npm_dev] do
  end

end
