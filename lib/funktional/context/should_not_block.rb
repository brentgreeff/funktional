module Funktional
  class ShouldNotBlock
    
    def self.build(options, context, &blk)
      
      case options.keys.first
        when :create
          ShouldNotCreateBlock.new(options[:create], context)
        else
          raise "Unknown assertion [should_not #{options.keys.first}]"
      end
    end
  end
end
