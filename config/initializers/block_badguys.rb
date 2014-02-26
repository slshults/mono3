Rails::Application.configure do

  config.middleware.insert_before(Rack::Lock, Rack::Block) do
    ip_pattern '8.35.201.' do
      # expressions like '192.0.0.' also available
        halt 404
      end
  end
end
