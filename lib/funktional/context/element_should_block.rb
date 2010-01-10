module Funktional
  class ElementShouldBlock < ShouldBlock
    
    def initialize(recorder, context)
      @recorder, @context = recorder, context
      @should_name = "element(#{@recorder.__target})"
      
      @blk = lambda do
        element(recorder.__target).send(recorder.__meth(0)[:name], *recorder.__meth(0)[:args])
      end
    end
    
    def test_name_parts
      parts = ["test:", "#{@context.full_name},", "#{@should_name}"]
      parts << @recorder.__meth(0)[:name].to_s.gsub('_', ' ')
      
      if called?(:should_be) or called?(:should_contain)
        parts << "[#{@recorder.__meth(0)[:args]}]"
      end
      return parts
    end
    
    private
    
    def called?(name)
      @recorder.__meth(0)[:name].eql? name
    end
  end
end
