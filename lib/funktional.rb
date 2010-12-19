Rails.backtrace_cleaner.add_silencer { |line| line =~ /funktional/ }

if Rails.env.eql? 'test' or $0 == 'irb'
  require File.join(File.dirname(__FILE__), "funktional", "load")
end
