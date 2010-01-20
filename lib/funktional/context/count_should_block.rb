module Funktional
  class CountShouldBlock < ShouldBlock
    
    def initialize(recorder, context)
      @recorder, @context = recorder, context
      @should_name = "count(#{@recorder.__target})"
      
      @blk = lambda do
        count(recorder.__target).send(recorder.__meth(0)[:name], *recorder.__meth(0)[:args])
      end
    end
    
    def test_name_parts
      parts = ["test:", "#{@context.full_name},", "#{@should_name}"]
      parts << @recorder.__meth(0)[:name].to_s.gsub('_', ' ')
      parts << "[#{@recorder.__meth(0)[:args]}]"
      
      return parts
    end
  end
end
