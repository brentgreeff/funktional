module Funktional
  class ShouldDeleteBlock < ShouldBlock
    
    def initialize(klass, context)
      @context = context
      @should_name = "delete a #{klass}"
      
      @before = lambda { @before_setup_count = klass.count }
      where = test_and_line_no
      
      @blk = lambda do
        expected_count = @before_setup_count - 1 
        assert_equal expected_count, klass.count, "New [#{klass}] was not deleted. #{where}"
      end
    end
  end
end
