module Funktional
  class AssignedShouldBlock < ShouldBlock
    
    def initialize(recorder, context)
      @recorder, @context = recorder, context
      @should_name = "the assigned(#{@recorder.__target})"
      
      @blk = lambda do
        result = nil
        
        recorder.__each_called do |meth, args|
          if result.nil?
            result = assigned(recorder.__target).send(meth, *args)
          else
            result.send(meth, *args)
          end
        end
      end
    end
    
    def test_name_parts
      call_chain = ''
      
      @recorder.__each_called do |meth, args|
        call_chain << ".#{meth}" unless meth.eql? :should_be
      end
      @should_name << "#{call_chain} should be [#{@recorder.__last_value}]"
      
      return ["test:", "#{@context.full_name},", "#{@should_name}"]
    end
  end
end
