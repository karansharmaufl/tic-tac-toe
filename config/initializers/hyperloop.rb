Hyperloop.configuration do |config|
  config.transport = :simple_poller
  config.import 'bootstrap-sprockets', client_only: true
end