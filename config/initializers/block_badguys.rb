  use Rack::Block do
    ip_pattern '8.35.201.' do
      halt 404
     end
  end
run App.new

