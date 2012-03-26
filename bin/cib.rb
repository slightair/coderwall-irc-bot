# -*- coding:utf-8 -*-
require 'net/irc'
require 'yaml'
require 'daemon_spawn'

require File.expand_path(File.dirname(__FILE__) + '/../lib/coderwall')

class CoderwallIrcBot < Net::IRC::Client
  include CoderWall

  def on_rpl_welcome(m)
    post JOIN, opts.channel
  end

  def on_privmsg(m)
    channel, message = *m
    if message.force_encoding('utf-8') =~ /^coderwall:\s*(\w+)/
      post(NOTICE, channel, coderwall_user_status($1))
    end
  end

  def coderwall_user_status(user_name)
    user_achivement = CoderwallApi.get_user_achievement(user_name)
    return user_achivement[:msg] unless user_achivement[:msg] == ''
    return "#{user_achivement[:name]} has #{user_achivement[:badges].size} badges!"
  end
end

class Cib < DaemonSpawn::Base
  def start(args)
    puts "start : #{Time.now}"
    server_config = YAML.load_file("../config/config.yaml")['server']
    client = CoderwallIrcBot.new(server_config['host'], server_config['port'],
    {:nick => server_config['nick'], :user => server_config['user'], :real => server_config['real'],
    :channel => server_config['channel']})
    client.start
  end

  def stop
    puts "stop  : #{Time.now}"
  end
end

Cib.spawn!({
  :working_dir => File.dirname(__FILE__),
  :pid_file => File.expand_path(File.dirname(__FILE__) + '/../tmp/cib.pid'),
  :log_file => File.expand_path(File.dirname(__FILE__) + '/../log/cib.log'),
  :sync_log => true,
  :singleton => true
})
