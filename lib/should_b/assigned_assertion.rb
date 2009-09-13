module ShouldB
  class AssignedAssertion
    def initialize(klass)
      @klass = klass
      @symbol = get_symbol
      @test = ShouldB.test_instance
      @assigned = @test.assigns(@symbol)
      
      @test.assert_not_nil @assigned, "No [#{@symbol}] assigned"
      @test.assert @assigned.is_a?(klass), type_safety_failed_msg
    end
    
    def should_be(expected_value)
      @test.assert_equal expected_value, @assigned
    end
    
    protected
    
    def method_missing(method, *args)
      RecursiveAssertion.new(@assigned, method)
    end
    
    def get_symbol
      @klass.to_s.tableize.singularize.to_sym
    end
    
    def type_safety_failed_msg
      "assigned [#{@symbol}] is not a [#{@klass}]"
    end
  end
end
