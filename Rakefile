require 'rubygems'
require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'echoe'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the should_b plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the should_b plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'ShouldB'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
  
Echoe.new('funktional', '1.0.0') do |p|
  p.description     = "Alternative test/unit framework"  
  p.url             = "http://github.com/brentgreeff/funktional"  
  p.author          = "Brent Greeff and Felix Clack"  
  p.email           = "felixclack@gmail.com"  
  p.ignore_pattern  = ["init.rb", "install.rb", "uninstall.rb"]  
  p.development_dependencies = []
end  
  
Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }