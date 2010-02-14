module Funktional
  class ShouldNotBlock
    
    def self.build(options, context, &blk)
      
      case options.keys.first
        when :create
          ShouldNotCreateBlock.new(options[:create], context)
        when :delete
          ShouldNotDeleteBlock.new(options[:delete], context)
        when :send_email
          ShouldNotSendEmailBlock.new(context)
        else
          raise "Unknown assertion [should_not #{options.inspect}]"
      end
    end
  end
end
