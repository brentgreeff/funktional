if RAILS_ENV.eql? 'test'
  require File.join(File.dirname(__FILE__), "lib", "should_b")
end
