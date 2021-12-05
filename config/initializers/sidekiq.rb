# require 'sidekiq'
# Sidekiq.configure_client do |config|
#   config.redis= { :size=> 1 } #, url: ENV['REDIS_URL']
#   # accepts :expiration (optional)
#   Sidekiq::Status.configure_client_middleware config, expiration: 30.minutes
#   config.redis= { url: 'redis://localhost:6379/0' }
# end
# Sidekiq.configure_server do |config|
#   # accepts :expiration (optional)
#   Sidekiq::Status.configure_server_middleware config, expiration: 30.minutes
#   # accepts :expiration (optional)
#   Sidekiq::Status.configure_client_middleware config, expiration: 30.minutes
#   config.redis= { url: 'redis://localhost:6379/0' }
# end