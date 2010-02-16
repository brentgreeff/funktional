module Funktional
  class ShouldBlock
    
    def self.build(options, context, &blk)
      return self.new(name = options, context, &blk) if options.is_a? String
      
      options = {:render_404 => 'public/404'} if options == :render_404
      
      case options.keys.first
        when :create
          ShouldCreateBlock.new(options[:create], context)
        when :delete
          ShouldDeleteBlock.new(options[:delete], context)
        else
          DelegatingShouldBlock.new(options, context, &blk)
      end
    end
    
    def initialize(should_name, context, &blk)
      raise 'block required' unless block_given?
      @should_name, @blk, @context = should_name, blk, context
    end
    
    def to_test
      context, blk, before = @context, @blk, @before
      
      @context.test_unit_class.send(:define_method, build_test_name) do
        begin
          context.run_parent_setup_blocks(self)
          before.bind(self).call if before
          
          context.run_current_setup_blocks(self)
          blk.bind(self).call
        ensure
          context.run_all_teardown_blocks(self)
        end
      end
    end
    
    protected
    
    def test_and_line_no
      stack_frame = caller.grep(/bind/).last
      stack_frame.split(':in ').first
    end
    
    def build_test_name
      test_name = test_name_parts.flatten.join(' ')
      
      if @context.test_unit_class.instance_methods.include?(test_name)
        warn "  * WARNING: '#{test_name}' is already defined"
      end
      return test_name.to_sym
    end
    
    def test_name_parts
      ["test:", @context.full_name, "should", "#{@should_name}."]
    end
  end
end
