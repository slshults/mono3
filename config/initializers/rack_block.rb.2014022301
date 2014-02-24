mono3::Application.configure do
 config.middleware.insert_before(Rack::Lock, Rack::Block) do  
   ua_pattern demosites do
   halt 404
  end

end
