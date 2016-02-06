YUM_CMD = "sudo yum install -y -q"

Dir['tasks/*.rake'].each { |file| load(file) }

task :default => ["yum:all", "node:all", "setup:all", "man:all"] do
end

