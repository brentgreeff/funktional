module ShouldB
  class FlashedAssertion < ShouldB::Assertion
    def initialize(symbol)
      @symbol = symbol
    end
    
    def should_be(expected_value)
      assert_equal expected_value, flash[@symbol]
    end
  end
end
