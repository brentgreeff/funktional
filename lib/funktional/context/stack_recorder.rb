module Funktional
  class BlankSlate
    instance_methods.each { |m| undef_method m unless m =~ /^__/ }
  end
  
  class StackRecorder < BlankSlate
    attr_reader :__target
    
    def initialize(target)
      @__target = target
      @__methods = []
    end
    
    def __meth(index)
      @__methods[index]
    end
    
    def __each_called
      @__methods.each { |meth| yield [meth[:name], meth[:args]] }
    end
    
    def __last_value
      @__methods.last[:args].first
    end
    
    def method_missing(method_name, *args)
      @__methods << {
        :name => method_name,
        :args => args
      }
      return self
    end
  end
end
