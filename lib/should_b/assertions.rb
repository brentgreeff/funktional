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
      
      symbol = klass.to_s.tableize.singularize.to_sym
      
      assert_not_nil assigns(symbol), "No [#{symbol}] assigned"
      assert ! assigns(symbol).new_record?, "[#{klass}] is a new record"
      assert assigns(symbol).is_a?(klass), "assigned [#{symbol}] is not a [#{klass}]"
      
      @symbol = symbol
    end
    
    def should_be(expected_value)
      assert_equal expected_value, assigns(@symbol)
    end
  end
  
  # Email
  
  class EmailAssertion < Assertion
    def initialize(details, test_instance)
      super(test_instance)
      
      if ActionMailer::Base.deliveries.size < 1
        flunk 'No emails have been sent'
      end
      
      email = ActionMailer::Base.deliveries.last
      
      details.each_key do |key|
        case key
          when :from
            then assert_equal details[:from], email.from[0]
          when :to
            then assert_equal details[:to], email.to[0]
          when :subject
            then assert_equal details[:subject], email.subject
          when :containing
            then check_containing(email.body, details[:containing])
          else
            flunk "Assertion key: [#{key}] not recognised"
        end
      end
    end
    
    def check_containing(body, should_contain)
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
