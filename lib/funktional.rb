Rails.backtrace_cleaner.add_silencer { |line| line =~ /funktional/ }

if Rails.env.eql? 'test' or $0 == 'irb'
  require 'funktional/load'
end
