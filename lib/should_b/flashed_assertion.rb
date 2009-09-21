module ShouldB
  class FlashedAssertion < ShouldB::Assertion
    def initialize(symbol)
      @symbol = symbol
    end
    
    def should_be(expected_value)
      assert_not_nil flash[@symbol], "Flash is empty [#{expected_value}] expected."
      assert_equal expected_value, flash[@symbol]
    end
  end
end
