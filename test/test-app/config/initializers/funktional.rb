# This simulates loading the funktional plugin, but without relying on
# vendor/plugins

funktional_path = File.join(File.dirname(__FILE__), *%w(.. .. .. ..))
funktional_lib_path = File.join(funktional_path, "lib")

$LOAD_PATH.unshift(funktional_lib_path)
load File.join(funktional_path, "init.rb")
