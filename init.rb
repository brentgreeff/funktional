if RAILS_ENV.eql? 'test'
  require File.join(File.dirname(__FILE__), "lib", "should_b")
end

require 'should_b/random_characters'
include ShouldB::RandomCharacters
