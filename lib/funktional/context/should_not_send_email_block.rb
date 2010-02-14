module Funktional
  class ShouldNotSendEmailBlock < ShouldBlock
    
    def initialize(context)
      @context = context
      @should_name = "not send an email"
      
      @before = lambda { @before_setup_count = ActionMailer::Base.deliveries.size }
      where = test_and_line_no
      
      @blk = lambda do
        expected_count = @before_setup_count
        current = ActionMailer::Base.deliveries.size
        assert_equal expected_count, current, "New [Email] was sent."
      end
    end
  end
end
