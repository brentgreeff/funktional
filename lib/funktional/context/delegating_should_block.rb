module Funktional
  class DelegatingShouldBlock < ShouldBlock
    
    def initialize(options, context, &blk)
      @should_name = build_should_name(options, &blk)
      @blk = proc { should(options, &blk) }
      @context = context
    end
    
    def build_should_name(options, &blk)
      case options.keys.first
        when :render
          "render the [#{options[:render]}] template"
        when :render_404
          "render the [#{options[:render_404]}] template with a [404] status code"
        when :redirect_to
          "redirect to the [#{options[:redirect_to]}] url"
        when :assign_new
          "assign a new [#{options[:assign_new]}]"
        when :route, :method
          args = (options.length > 1) ? options : options.values.first
          RouteChecker.build(args, &blk).__test_name
        when :send_email
          "send an email #{options[:send_email].inspect}"
        else
          raise NoMethodError, "#{options.inspect} is not recognised"
      end
    end
  end
end
