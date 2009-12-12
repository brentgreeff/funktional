module Funktional
  module ModelAssertions
    def should_require_a(field, expected_error_message = nil)
      check_test_instance!
      must_be_valid_before_test!
      
      assign_nil_to(field, expected_error_message) do
        assert_invalid("'#{self.class.name}' should require a '#{field}'")
      end
    end
    
    alias :should_require_an :should_require_a
    
    def should_not_require_a(field)
      check_test_instance!
      
      assign_nil_to(field) do
        assert_valid
      end
    end
    
    alias :should_not_require_an :should_not_require_a
    
    def should_have_invalid(field, expected_error_message = nil)
      check_test_instance!
      
      assert_invalid("'#{self.class.name}' should have invalid '#{field}'")
      assert_message(field, expected_error_message) if expected_error_message
    end
    
    def should_mass_assign(*fields)
      check_test_instance!
      fields.each do |field|
        Funktional.test_instance.assert self.class.accessible_attributes.include?(field.to_s)
      end
    end
    
    def should_not_mass_assign(*fields)
      check_test_instance!
      accessible_attrib = self.class.accessible_attributes.to_a
      protected_attrib = self.class.protected_attributes.to_a
      fields = fields.map(&:to_s)
      
      if accessible_attrib.any?
        common_fields = (accessible_attrib & fields)
        @test.assert((common_fields.size == 0), "#{common_fields.inspect} marked accessible")
      elsif protected_attrib.any?
        common_fields = (protected_attrib & fields)
        difference = (fields - protected_attrib)
        @test.assert((common_fields.size == fields.size), "#{difference.inspect} not protected")
      else
        @test.flunk "#{fields.inspect} not protected"
      end
    end
    
    def should_protect(*fields)
      check_test_instance!
      fields.each do |field|
        Funktional.test_instance.assert self.class.protected_attributes.include?(field.to_s)
      end
    end
    
    def should_respond_to(method)
      Funktional.test_instance.assert_respond_to self, method
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
    
    def assert_invalid(message)
      Funktional.test_instance.assert self.invalid?, message
    end
    
    def assert_valid
      Funktional.test_instance.assert self.valid?
    end
    
    def assert_message(field, expected_error_message)
      Funktional.test_instance.assert_equal(expected_error_message, self.errors[field])
    end
    
    def must_be_valid_before_test!
      if self.invalid?
        error = "Funktional requires a valid instance of #{self.class.name}"
        Funktional.test_instance.flunk error
      end
    end
    
    def check_test_instance!
      if Funktional.test_instance.nil?
        raise Funktional::Setup::Error, 'Did you forget to (setup :funktional) in test/test_helper?'
      end
      @test = Funktional.test_instance
    end
  end
end
