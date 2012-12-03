require 'capistrano-deploy'

use_recipes :git, :rails, :bundle, :unicorn, :rvm

server '54.235.255.54', :web, :app, :db, :primary => true
set :user, 'ubuntu'
set :repository, 'git@github.com:oleghaidul/edu.git'

set(:deploy_to) { "/home/ubuntu/production" }

after 'deploy:update',  'bundle:install'
after 'deploy:restart', 'unicorn:reexec'

