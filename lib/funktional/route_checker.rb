module Funktional
  
  class RouteChecker
    instance_methods.each do |method|
      undef_method(method) unless %w(__send__ __id__ instance_eval).include?(method)
    end
    
    attr_reader :__path_and_method, :__controller_action_etc
    
    def self.build(params, &blk)
      checker = self.new(params)
      
      checker.instance_eval(&blk)
      return checker
    end
    
    def initialize(params)
      @__path_and_method = __get_path_and_method(params)
      @__controller_action_etc = {}
    end
    
    def __test_name
      path = @__path_and_method[:path]
      method = @__path_and_method[:method]
      
      "route '#{path}' :method '#{method}' to #{@__controller_action_etc.inspect}"
    end
    
    def method_missing(method_name, value)
      @__controller_action_etc[method_name] = value
    end
    
    private
    
    def __get_path_and_method(params)
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
  end
end
