module ShouldB
  module ModelAssertions
    def should_require_a(field, expected_error_message = nil)
      if self.invalid?
        raise ArgumentError, "ShouldB requires a valid instance of #{self.class}"
      end
      
      saved_existing_value = self.send field
      self.send "#{field}=", nil
      
      ShouldB.test_instance.assert self.invalid?
      
      if expected_error_message
        ShouldB.test_instance.assert_equal expected_error_message, self.errors[field]
      end
      
      self.send "#{field}=", saved_existing_value
      self.valid?
    end
    
    def should_not_require_a(field)
      saved_existing_value = self.send field
      self.send "#{field}=", nil
      
      ShouldB.test_instance.assert self.valid?
      
      self.send "#{field}=", saved_existing_value
    end
    
    def should_require_an(field, expected_error_message = nil)
      should_require_a(field, expected_error_message)
    end
    
    def should_not_require_an(field)
      should_not_require_a(field)
    end
    
    def should_have_invalid(field, expected_error_message = nil)
      ShouldB.test_instance.assert self.invalid?
      
      if expected_error_message
        ShouldB.test_instance.assert_equal expected_error_message, self.errors[field]
      end
    end
  end
end
