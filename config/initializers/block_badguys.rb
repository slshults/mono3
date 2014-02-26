monologues::Application.configure do

  config.middleware.insert_before(Rack::Lock, Rack::Block) do
  use ::Rack::Block do
    ip_pattern '8.35.201.' do
      halt 404
     end
  end
end

