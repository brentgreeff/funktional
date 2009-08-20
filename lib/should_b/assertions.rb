module ShouldB
  
  class Assertion
    def initialize(test_instance)
      @test_instance = test_instance
    end
    
    protected
    
    def method_missing(method, *args)
      @test_instance.send method, *args
    end
  end
  
  # Flash
  
  class FlashedAssertion < Assertion
    def initialize(symbol, test_instance)
      super(test_instance)
      @symbol = symbol
    end
    
    def should_be(expected_value)
      assert_equal expected_value, flash[@symbol]
    end
  end
  
  # Assignment
  
  class AssignedAssertion < Assertion
    def initialize(klass, test_instance)
      super(test_instance)
      
      @symbol = klass.to_s.tableize.singularize.to_sym
      
      assert_not_nil assigns(@symbol), "No [#{symbol}] assigned"
      assert ! assigns(@symbol).new_record?, "[#{klass}] is a new record"
      assert assigns(@symbol).is_a?(klass), "assigned [#{symbol}] is not a [#{klass}]"
    end
    
    def should_be(expected_value)
      assert_equal expected_value, assigns(@symbol)
    end
  end
  
  # Email
  
  class EmailAssertion < Assertion
    def initialize(expectations, test_instance)
      super(test_instance)
      
      if ActionMailer::Base.deliveries.size < 1
        flunk 'No emails have been sent'
      end
      
      email = ActionMailer::Base.deliveries.last
      
      expectations.each_key do |key|
        case key
          when :from
            then check_from(expectations[:from], email.from)
          when :to
            then check_to(expectations[:to], email.to)
          when :subject
            then assert_equal expectations[:subject], email.subject
          when :containing
            then check_containing(expectations[:containing], email.body)
          else
            flunk "Assertion key: [#{key}] not recognised"
        end
      end
    end
    
    def check_from(expected_from, email_from)
      if email_from.nil?
        flunk 'email is missing a [from]'
      end
      assert_equal expected_from, email_from[0]
    end
    
    def check_to(expected_to, email_to)
      if email_to.nil?
        flunk 'email is missing a [to]'
      end
      assert_equal expected_to, email_to[0]
    end
    
    def check_containing(should_contain, body)
      if should_contain.is_a? Array
        should_contain.each do |should_i|
          assert_match /#{should_i}/, body
        end
      else
        assert_match /#{should_contain}/, body
      end
    end
  end
  
end
