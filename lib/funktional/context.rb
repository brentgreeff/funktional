# borrowing heavily from shoulda contexts.

module Funktional
  class Context
    
    attr_accessor :name
    attr_accessor :parent
    attr_accessor :sub_contexts
    attr_accessor :setup_blocks
    attr_accessor :teardown_blocks
    attr_accessor :should_blocks
    
    def initialize(name, parent, &blk)
      Funktional.add_context(self)
      self.name = name
      self.parent = parent
      self.setup_blocks = []
      self.teardown_blocks = []
      self.should_blocks = []
      self.sub_contexts = []
      
      merge_block(&blk)
      Funktional.remove_context
    end
    
    def merge_block(&blk)
      blk.bind(self).call
    end
    
    def context(name, &blk)
      self.sub_contexts << Context.new(name, self, &blk)
    end
    
    def setup(&blk)
      self.setup_blocks << blk
    end
    
    alias :before :setup
    
    def teardown(&blk)
      self.teardown_blocks << blk
    end
    
    alias :after :teardown
    
    def should(options, &blk)
      self.should_blocks << ShouldBlock.build(options, self, &blk)
    end
    
    def should_not(options, &blk)
      self.should_blocks << ShouldNotBlock.build(options, self, &blk)
    end
    
    def element(selector)
      recorder = StackRecorder.new(selector)
      self.should_blocks << ElementShouldBlock.new(recorder, self)
      
      return recorder
    end
    
    def count(selector)
      recorder = StackRecorder.new(selector)
      self.should_blocks << CountShouldBlock.new(recorder, self)
      
      return recorder
    end
    
    def assigned(target)
      recorder = StackRecorder.new(target)
      self.should_blocks << AssignedShouldBlock.new(recorder, self)
      
      return recorder
    end
    
    def flashed(kind)
      recorder = StackRecorder.new(kind)
      self.should_blocks << FlashedShouldBlock.new(recorder, self)
      
      return recorder
    end
    
    def full_name
      parent_name = parent.full_name if sub_context?
      return [parent_name, name].join(" ").strip
    end
    
    def sub_context?
      parent.is_a?(self.class)
    end
    
    def test_unit_class
      sub_context? ? parent.test_unit_class : parent
    end
    
    def run_all_setup_blocks(binding)
      run_parent_setup_blocks(binding)
      run_current_setup_blocks(binding)
    end
    
    def run_parent_setup_blocks(binding)
      self.parent.run_all_setup_blocks(binding) if sub_context?
    end
    
    def run_current_setup_blocks(binding)
      setup_blocks.each do |setup_block|
        setup_block.bind(binding).call
      end
    end
    
    def run_all_teardown_blocks(binding)
      teardown_blocks.reverse.each do |teardown_block|
        teardown_block.bind(binding).call
      end
      self.parent.run_all_teardown_blocks(binding) if sub_context?
    end
    
    def build
      self.should_blocks.map(&:to_test)
      sub_contexts.each { |context| context.build }
    end
    
    def method_missing(method, *args, &blk)
      test_unit_class.send(method, *args, &blk)
    end
  end
end
