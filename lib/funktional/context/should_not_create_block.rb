module Funktional
  class ShouldNotCreateBlock < ShouldBlock
    
    def initialize(klass, context)
      @context = context
      @should_name = "not create a #{klass}"
      
      @before = lambda { @before_setup_count = klass.count }
      where = test_and_line_no
      
      @blk = lambda do
        expected_count = @before_setup_count
        assert_equal expected_count, klass.count, "New [#{klass}] was created. #{where}"
      end
    end
  end
end
