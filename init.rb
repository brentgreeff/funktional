if Rails.env.eql? 'test'
  require File.join(File.dirname(__FILE__), "lib", "funktional")
end
