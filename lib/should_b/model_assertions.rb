module ShouldB
  module ModelAssertions
    def should_require_a(field, expected_error_message = nil)
      check_test_instance!
      must_be_valid_before_test!
      
      assign_nil_to do |field, expected_error_message|
        assert_invalid
      end
    end
    
    def should_not_require_a(field)
      check_test_instance!
      
      assign_nil_to do |field|
        assert_valid
      end
    end
    
    def should_require_an(field, expected_error_message = nil)
      should_require_a(field, expected_error_message)
    end
    
    def should_not_require_an(field)
      should_not_require_a(field)
    end
    
    def should_have_invalid(field, expected_error_message = nil)
      check_test_instance!
      
      assert_invalid
      assert_message(field, expected_error_message) if expected_error_message
    end
    
    private
    
    def assign_nil_to(field, expected_error_message = nil)
      saved_existing_value = self.send field
      self.send "#{field}=", nil
      
      yield
      
      assert_message(field, expected_error_message) if expected_error_message
      
      self.send "#{field}=", saved_existing_value
      
      # clear errors
      self.valid?
    end
    
    def assert_invalid
      ShouldB.test_instance.assert self.invalid?
    end
    
    def assert_valid
      ShouldB.test_instance.assert self.valid?
    end
    
    def assert_message(field, expected_error_message)
      ShouldB.test_instance.assert_equal expected_error_message, self.errors[field]
    end
    
    def must_be_valid_before_test!
      if self.invalid?
        raise ArgumentError, "ShouldB requires a valid instance of #{self.class}"
      end
    end
    
    def check_test_instance!
      if ShouldB.test_instance.nil?
        raise ShouldB::Setup::Error, 'Did you forget to (setup :should_b) in test/test_helper?'
      end
    end
  end
end
