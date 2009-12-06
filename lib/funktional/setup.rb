module Funktional
  mattr_accessor :test_instance
  
  module Setup
    def funktional
      Funktional.test_instance = self
    end
    
    class Error < RuntimeError; end
  end
end
