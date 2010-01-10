module Funktional
  class FlashedShouldBlock < ShouldBlock
    
    def initialize(recorder, context)
      @recorder, @context = recorder, context
      @should_name = "flash[:#{@recorder.__target}]"
      
      @blk = lambda do
        flashed(recorder.__target).send(recorder.__meth(0)[:name], *recorder.__meth(0)[:args])
      end
    end
    
    def test_name_parts
      ["test:", "#{@context.full_name},", @should_name, "should be", "[#{@recorder.__meth(0)[:args]}]"]
    end
  end
end
