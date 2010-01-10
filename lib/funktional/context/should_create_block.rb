module Funktional
  class ShouldCreateBlock < ShouldBlock
    
    def initialize(klass, context)
      @context = context
      @should_name = "create a #{klass}"
      
      @before = lambda { @before_setup_count = klass.count }
      where = test_and_line_no
      
      @blk = lambda do
        expected_count = 1
        assert_equal expected_count, klass.count, "New [#{klass}] was not created. #{where}"
      end
    end
  end
end
