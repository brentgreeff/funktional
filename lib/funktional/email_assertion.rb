module Funktional
  class EmailAssertion < Funktional::Assertion
    def initialize(expectations)
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
          assert_match /#{Regexp.escape(should_i)}/, body
        end
      else
        assert_match /#{Regexp.escape(should_contain)}/, body
      end
    end
  end
end
