ssh_options[:forward_agent] = true
default_run_options[:pty] = true
set :application, "newapp"
set :scm, :git
set :repository,  "git@github.com:supertesting/newapp.git"
set :user, "ubuntu"
set :scm_passphrase, "lolpasswd1"
set :branch, "master"

set :use_sudo, false

role :puppetmaster, "puppet"

set :deploy_to, "/usr/mypuppet"

task :display_uptime, :roles => :puppetmaster do
	run "uptime"
end

task :push, :roles => :puppetmaster do
	run "rm -rf /etc/puppet/manifests;rm -rf /etc/puppet/modules;mkdir /etc/puppet/manifests;mkdir /etc/puppet/modules;cp -R /usr/mypuppet/current/manifests/* /etc/puppet/manifests/;cp -R /usr/mypuppet/current/modules/* /etc/puppet/modules/"
end

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`


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
