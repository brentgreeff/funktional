module ShouldB
  mattr_accessor :test_instance
  
  module Setup
    def should_b
      ShouldB.test_instance = self
    end
    
    class Error < RuntimeError; end
  end
end
