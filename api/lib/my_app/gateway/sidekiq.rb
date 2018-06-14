require 'json'
require 'redis'
require 'securerandom'

module MyApp
  module Gateway
    class Sidekiq
      def initialize(redis: Redis)
        @redis = redis.new(url: 'redis://redis:6379')
      end

      def do_later(klass:, args:)
        message = create_message(klass: klass, args: args)
        @redis.lpush('queue:default', JSON.dump(message))
      end

      private

      def create_message(klass:, args:)
        {
          'class' => klass,
          'queue' => 'default',
          'args' => args,
          'jid' => SecureRandom.hex(12),
          'retry' => true,
          'created_at' => Time.now.to_f,
          'enqueued_at' => Time.now.to_f
        }
      end
    end
  end
end
