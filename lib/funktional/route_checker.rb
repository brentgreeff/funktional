module Funktional
  
  class RouteChecker
    
    def initialize
      @params = []
    end
    
    def controller(value)
      @params << [:controller, value]
    end
    
    def action(value)
      @params << [:action, value]
    end
    
    def get_params
      p = {}
      
      for mapping in @params
        p[mapping.first] = mapping.last
      end
      return p
    end
    
    def to_s
      param_strings = []
      
      for mapping in @params
        param_strings << ":#{mapping.first} => '#{mapping.last}'"
      end
      return param_strings.join(', ')
    end
    
    def self.build(&blk)
      checker = self.new
      
      checker.instance_eval(&blk)
      return checker
    end
  end
end
