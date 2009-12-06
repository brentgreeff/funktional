module Funktional
  class RecursiveAssertion < Funktional::Assertion
    def initialize(assigned, method)
      @test = Funktional.test_instance
      @assigned = assigned
      @method = method
      
      @test.assert_respond_to @assigned, @method
    end
    
    def should_be(expected_value)
      value = @assigned.send @method
      @test.assert_equal expected_value, value
    end
    
    protected
    
    def method_missing(method, *args)
      @assigned = @assigned.send @method
      RecursiveAssertion.new(@assigned, method)
    end
  end
end
