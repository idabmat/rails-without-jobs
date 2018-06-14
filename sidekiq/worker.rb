require 'sidekiq'

Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://redis:6379' }
end

class MyWorker
  include Sidekiq::Worker

  def perform(complexity)
    case complexity
    when 'super hard'
      sleep 10
      puts 'This took a while!'
    when 'hard'
      sleep 5
      puts 'Not too bad'
    else
      sleep 1
      puts 'Piece of cake'
    end
  end
end
