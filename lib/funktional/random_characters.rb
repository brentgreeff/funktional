module Funktional
  module RandomCharacters
    def random_characters
      chars = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ23456789'
      str = ''
      self.times { str << chars[rand(chars.size)] }
      
      return str
    end
  end
end
