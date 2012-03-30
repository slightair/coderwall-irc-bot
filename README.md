coderwall IRC BOT [![Gem Status](https://gemnasium.com/conmame/coderwall-irc-bot.png)](https://gemnasium.com/conmame/coderwall-irc-bot)
====

Description
----
This BOT reply asked user [coderwall](http://coderwall.com/) status.

HOW TO USE
----

###irc commands
* coderwall: USER_NAME - Get Coderwall badge.
* coderwall-d: USER_NAME - Get Coderwall badge detail.

###install gems
    #bundle install
    
or

    #gem install coderwaller daemon-spawn net-irc

###config/config.yaml
    server:
      host:     chat.freenode.net
      port:     6667
      nick:     coderwall_irc_bot
      user:     coderwall_irc_bot
      real:     coderwall_irc_bot
      channel:	'#hoge'
      
###commands
start `ruby bin/cib.rb start`  
stop `ruby bin/cib.rb stop`

###directory
* tmp - pid file
* log - log file

TODO
----
* 色々綺麗にする
  
LICENCE
----
* Copyright © 2012 con_mame. See LICENSE.txt for further details.

* This program use thes Library and API  
 [Net::IRC](http://github.com/cho45/net-irc)  
 [daemon-spawn](https://github.com/alexvollmer/daemon-spawn)  
 [coderwall API](http://coderwall.com/api)
 
AUTHOR
----
con_mame con_mame@conma.me
