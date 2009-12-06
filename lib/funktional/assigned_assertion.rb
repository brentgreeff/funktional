module Funktional
  class AssignedAssertion
    def initialize(klass_or_symbol)
      if klass_or_symbol.is_a? Symbol
        @symbol = klass_or_symbol
      else
        @klass = klass_or_symbol
        @symbol = get_symbol_from_klass
      end
      
      @test = Funktional.test_instance
      @assigned = @test.assigns(@symbol)
      
      @test.assert_not_nil @assigned, "No [#{@symbol}] assigned"
      
      if @klass
        @test.assert @assigned.is_a?(@klass), type_safety_failed_msg
      end
    end
    
    def should_be(expected_value)
      @test.assert_equal expected_value, @assigned
    end
    
    protected
    
    def method_missing(method, *args)
      RecursiveAssertion.new(@assigned, method)
    end
    
    def get_symbol_from_klass
      @klass.to_s.tableize.singularize.to_sym
    end
    
    def type_safety_failed_msg
      "assigned [#{@symbol}] is not a [#{@klass}]"
    end
  end
end
