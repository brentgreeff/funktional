module Funktional
  
  module TestClassMethods
    def context(name, &blk)
      if Funktional.current_context
        Funktional.current_context.context(name, &blk)
      else
        context = Funktional::Context.new(name, self, &blk)
        context.build
      end
    end
    
    def should(name, &blk)
      if Funktional.current_context
        raise 'block required' unless block_given?
        Funktional.current_context.should(name, &blk)
      else
        context_name = self.name.gsub(/Test/, "")
        
        context = Funktional::Context.new(context_name, self) do
          raise 'block required' unless block_given?
          should(name, &blk)
        end
        context.build
      end
    end
  end
end
