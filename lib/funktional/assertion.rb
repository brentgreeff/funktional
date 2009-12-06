module Funktional
  class Assertion
    protected
    
    def method_missing(method, *args)
      Funktional.test_instance.send method, *args
    end
  end
end
