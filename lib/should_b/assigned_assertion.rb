module ShouldB
  class AssignedAssertion < ShouldB::Assertion
    def initialize(klass)
      @symbol = klass.to_s.tableize.singularize.to_sym
      
      assert_not_nil assigns(@symbol), "No [#{@symbol}] assigned"
      assert ! assigns(@symbol).new_record?, "[#{klass}] is a new record"
      assert assigns(@symbol).is_a?(klass), "assigned [#{@symbol}] is not a [#{klass}]"
    end
    
    def should_be(expected_value)
      assert_equal expected_value, assigns(@symbol)
    end
  end
end
