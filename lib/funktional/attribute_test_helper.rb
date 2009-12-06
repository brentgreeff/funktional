module Funktional
  module AttributeTestHelper
    
    def missing_attrib(to_remove)
      copy_of_attrib = attrib.clone
      found = copy_of_attrib.delete to_remove
      raise Exception, 'attribute marked for removal is missing' unless found
      
      return copy_of_attrib
    end
    
    def blank_attrib(to_blank)
      attrib.merge(to_blank => '')
    end
    
    def replace_attrib(to_replace)
      key = to_replace.keys.first
      value = to_replace.values.first
      
      attrib.merge(key => value)
    end
    
    def add_attrib(addition)
      attrib.merge(addition)
    end
  end
end
