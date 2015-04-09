# config valid only for Capistrano 3.1
require 'bundler/capistrano'

set :application, 'ablys'
set :repository, 'git@github.com:prakashlaxkar/ablys.git'
set :applicationdir,  "/home/ubuntu/apps/ablys"
set :user, "ubuntu"

set :use_sudo, false
set :scm, :git
set :keep_releases, 2
set :rails_env, "production"
set :precompile_only_if_changed, true

set :deploy_to, "/home/ubuntu/apps/ablys"
set :deploy_via, :export

default_run_options[:pty] = true  # Forgo errors when deploying from windows
default_run_options[:shell] = '/bin/bash --login'

ssh_options[:keys] = %w(/Path/To/id_rsa)

after "deploy:update_code", "deploy:copy_configs"

task :prod do
  set :domain, "52.10.40.52"
  set :repository, "git@github.com:prakashlaxkar/ablys.git"
  set :local_repository, "git@github.com:prakashlaxkar/ablys.git"
  set :branch, "master"
  set :scm_verbose, true
  server "52.10.40.52", :app, :web, :db, :primary => true
  set :deploy_env, "prod"

  "deploy"

end

namespace :deploy do

  task :copy_configs, :roles => :app do
  end

  task :migrate, :roles => :app do
    run "cd #{release_path} && bundle exec rake db:migrate RAILS_ENV=production"
  end

  task :restart, :roles => :app, :except => { :no_release => true } do

    run "#{try_sudo} touch #{File.join(current_path, 'tmp', 'restart.txt')}"    
    if deploy_env == 'prod'
      tag_name = Time.now.strftime("deploy_%Y_%m_%d_%H_%M")

      system "git tag -a -m 'Deployment on prod' #{tag_name}"

      system "git push origin #{tag_name}"
      if $? != 0
        raise "Pushing tag to origin failed"
      end
    end
  end

  namespace :assets do
    task :precompile, :roles => :web, :except => { :no_release => true } do
      run "cd #{release_path} && bundle exec rake assets:precompile RAILS_ENV=production"
    end
  end
end


after "deploy:update", "deploy:migrate", "deploy:cleanup"
