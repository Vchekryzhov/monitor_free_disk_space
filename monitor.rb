# gem install sys-filesystem
# gem install telegram-bot-ruby
require 'telegram/bot'
require 'sys/filesystem'

token = ''

Telegram::Bot::Client.run(token) do |bot|
  while 1
    filesystem_stat = Sys::Filesystem.stat('/')
    free_gb = (filesystem_stat.block_size * filesystem_stat.blocks_available) / 1024 / 1024 / 1024
    bot.api.send_message(chat_id: "@state_monitor", text: "Warning free disck space #{free_gb} GB") if free_gb < 129
    sleep 5
  end
end
