if RAILS_ENV.eql? 'test'
  require File.join(File.dirname(__FILE__), "lib", "funktional")
end

if RAILS_ENV.eql? 'test' or $0 == 'irb'
  require 'funktional/random_characters'
  Integer.send :include, Funktional::RandomCharacters
end
