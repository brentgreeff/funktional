module Funktional
  class Email
    
    def self.find_closest(emails, expected)
      emails = emails.map { |email| new(email, expected) }
      emails.sort.first
    end
    
    attr_accessor :original
    attr_accessor :matches
    
    def initialize(email, expected)
      @original = email
      @expected = expected
      calculate_matches
    end
    
    def calculate_matches
      @matches = {}
      @expected.map { |expect| self.send "check_#{expect.first}" }
    end
    
    def <=>(other)
      other.total_matches <=> total_matches
    end
    
    def total_matches
      if @matches.has_key? :containing
        @matches.size + (@matches[:containing].size - 1)
      else
        @matches.size
      end
    end
    
    def check_from
      @matches[:from] = from if from.present? and (@expected[:from] == from)
    end
    
    def check_to
      @matches[:to] = to if to.present? and (@expected[:to] == to)
    end
    
    def check_subject
      if subject.present? and (@expected[:subject] == subject)
        @matches[:subject] = subject
      end
    end
    
    def check_containing
      should_contain = @expected[:containing]
      should_contain = [should_contain] unless should_contain.is_a? Array
      matches = []
      
      should_contain.each do |should_i|
        matches << should_i if body =~ /#{Regexp.escape(should_i)}/
      end
      @matches[:containing] = matches if matches.any?
    end
    
    def from
      @original.from[0]
    end
    
    def to
      @original.to[0]
    end
    
    def subject
      @original.subject
    end
    
    def body
      @original.body.raw_source
    end
  end
end
