module ShouldB
  class Assertion
    protected
    
    def method_missing(method, *args)
      ShouldB.test_instance.send method, *args
    end
  end
end
