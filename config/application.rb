config.middleware.insert 0, 'Rack::Rewrite' do
  r301 %r{.*}, 'http://shakespeare-monologues.org$&',
  :if => Proc.new { |rack_env| rack_env['SERVER_NAME'] != 'www.shakespeare-monologues.org' }
end
