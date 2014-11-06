require 'rubygems'
require 'daemons'

pwd = '/home/user/minecraft-server-utils/pLAN_web'
Daemons.run_proc('pLAN_web.rb', {:dir_mode => :normal, :dir => "/opt/pids/sinatra"}) do
  Dir.chdir(pwd)
  exec "ruby pLAN_web.rb"
end

