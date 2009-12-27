module Funktional
  
  class RouteChecker
    attr_reader :path_and_method, :controller_action_etc
    
    def initialize(params)
      @path_and_method = get_path_and_method(params)
      @controller_action_etc = {}
    end
    
    def controller(value)
      @controller_action_etc[:controller] = value
    end
    
    def action(value)
      @controller_action_etc[:action] = value
    end
    
    def get_path_and_method(params)
      if params.is_a? Hash
        {
          :path => params[:route],
          :method => params[:method].to_sym
        }
      else
        {
          :path => params,
          :method => :get
        }
      end
    end
    
    def to_s
      path = @path_and_method[:path]
      method = @path_and_method[:method]
      
      "route '#{path}' :method '#{method}' to #{@controller_action_etc.inspect}"
    end
    
    def self.build(params, &blk)
      checker = self.new(params)
      
      checker.instance_eval(&blk)
      return checker
    end
  end
end
