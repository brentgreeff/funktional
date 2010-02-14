module Funktional
  class ShouldNotBlock
    
    def self.build(options, context, &blk)
      
      if options.is_a? Symbol and options.eql? :send_email
        return ShouldNotSendEmailBlock.new(context)
      end
      
      case options.keys.first
        when :create
          ShouldNotCreateBlock.new(options[:create], context)
        when :delete
          ShouldNotDeleteBlock.new(options[:delete], context)
        else
          raise "Unknown assertion [should_not #{options.inspect}]"
      end
    end
  end
end
