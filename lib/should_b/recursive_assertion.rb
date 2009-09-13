module ShouldB
  class RecursiveAssertion < ShouldB::Assertion
    def initialize(assigned, method)
      @test = ShouldB.test_instance
      @assigned = assigned
      @method = method
      
      @test.assert_respond_to @assigned, @method
    end
    
    def should_be(expected_value)
      @test.assert_equal expected_value, @assigned.send @method
    end
    
    protected
    
    # def method_missing(method, *args)
    #   RecursiveAssertion.new(@assigned, method)
    # end
  end
end
