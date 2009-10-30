if RAILS_ENV.eql? 'test'
  require File.join(File.dirname(__FILE__), "lib", "should_b")
end

if RAILS_ENV.eql? 'test' or $0 == 'irb'
  require 'should_b/random_characters'
  Integer.send :include, ShouldB::RandomCharacters
end
