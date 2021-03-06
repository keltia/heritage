set :application, "heritage"
set :scm, :git
set :repository,  "ssh://penso@nimp.conovae.net/home/penso/heritage.git"
set :deploy_to, "/data/www/heritage"
ssh_options[:forward_agent] = true
default_run_options[:pty] = true 
set :use_sudo, false
set :keep_releases, 5

set :rvm_ruby_string, :local

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "plouf.4push.com"                          # Your HTTP server, Apache/etc
role :app, "plouf.4push.com"                          # This may be the same as your `Web` server
role :db,  "plouf.4push.com", :primary => true # This is where Rails migrations will run

set :shared_children, shared_children + %w{public/uploads}
after "deploy:update_code", "deploy:migrate"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

load 'deploy/assets'

require "rvm/capistrano"
require "bundler/capistrano"
require 'capistrano-unicorn'
