module Funktional
  class << self
    attr_accessor :contexts
    
    def contexts
      @contexts ||= []
    end
    
    def current_context
      self.contexts.last
    end
    
    def add_context(context)
      self.contexts.push(context)
    end
    
    def remove_context
      self.contexts.pop
    end
  end
end
