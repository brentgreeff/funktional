# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{funktional}
  s.version = "2.0.0"
  
  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Brent Greeff and Felix Clack"]
  s.date = %q{2010-03-06}
  s.description = %q{Alternative test/unit framework}
  s.email = %q{email@brentgreeff.com}
  s.extra_rdoc_files = [
    "README.rdoc",
    "lib/funktional.rb",
    "lib/funktional/assertion.rb",
    "lib/funktional/assigned_assertion.rb",
    "lib/funktional/attribute_test_helper.rb",
    "lib/funktional/context.rb",
    "lib/funktional/context/assigned_should_block.rb",
    "lib/funktional/context/collector.rb",
    "lib/funktional/context/count_should_block.rb",
    "lib/funktional/context/delegating_should_block.rb",
    "lib/funktional/context/element_should_block.rb",
    "lib/funktional/context/flashed_should_block.rb",
    "lib/funktional/context/should_block.rb",
    "lib/funktional/context/should_create_block.rb",
    "lib/funktional/context/should_delete_block.rb",
    "lib/funktional/context/should_not_block.rb",
    "lib/funktional/context/should_not_create_block.rb",
    "lib/funktional/context/should_not_delete_block.rb",
    "lib/funktional/context/should_not_send_email_block.rb",
    "lib/funktional/context/stack_recorder.rb",
    "lib/funktional/email_assertion.rb",
    "lib/funktional/flashed_assertion.rb",
    "lib/funktional/model_assertions.rb",
    "lib/funktional/random_characters.rb",
    "lib/funktional/recursive_assertion.rb",
    "lib/funktional/route_checker.rb",
    "lib/funktional/setup.rb",
    "lib/funktional/test_class_methods.rb",
    "lib/funktional/test_instance_methods.rb",
    "tasks/should_b_tasks.rake"
  ]
  s.files = [
    "MIT-LICENSE",
    "Manifest",
    "README.rdoc",
    "Rakefile",
    "lib/funktional.rb",
    "lib/funktional/assertion.rb",
    "lib/funktional/assigned_assertion.rb",
    "lib/funktional/attribute_test_helper.rb",
    "lib/funktional/context.rb",
    "lib/funktional/context/assigned_should_block.rb",
    "lib/funktional/context/collector.rb",
    "lib/funktional/context/count_should_block.rb",
    "lib/funktional/context/delegating_should_block.rb",
    "lib/funktional/context/element_should_block.rb",
    "lib/funktional/context/flashed_should_block.rb",
    "lib/funktional/context/should_block.rb",
    "lib/funktional/context/should_create_block.rb",
    "lib/funktional/context/should_delete_block.rb",
    "lib/funktional/context/should_not_block.rb",
    "lib/funktional/context/should_not_create_block.rb",
    "lib/funktional/context/should_not_delete_block.rb",
    "lib/funktional/context/should_not_send_email_block.rb",
    "lib/funktional/context/stack_recorder.rb",
    "lib/funktional/email_assertion.rb",
    "lib/funktional/flashed_assertion.rb",
    "lib/funktional/model_assertions.rb",
    "lib/funktional/random_characters.rb",
    "lib/funktional/recursive_assertion.rb",
    "lib/funktional/route_checker.rb",
    "lib/funktional/setup.rb",
    "lib/funktional/test_class_methods.rb",
    "lib/funktional/test_instance_methods.rb",
    "tasks/should_b_tasks.rake",
    "test/fixtures/posts.yml",
    "test/fixtures/users.yml",
    "test/functional/users_controller_test.rb",
    "test/test-app/app/controllers/application_controller.rb",
    "test/test-app/app/controllers/users_controller.rb",
    "test/test-app/app/helpers/application_helper.rb",
    "test/test-app/app/models/post.rb",
    "test/test-app/app/models/user.rb",
    "test/test-app/app/views/users/edit.html.erb",
    "test/test-app/app/views/users/index.html.erb",
    "test/test-app/app/views/users/new.html.erb",
    "test/test-app/config/boot.rb",
    "test/test-app/config/database.yml",
    "test/test-app/config/environment.rb",
    "test/test-app/config/environments/test.rb",
    "test/test-app/config/initializers/funktional.rb",
    "test/test-app/config/initializers/new_rails_defaults.rb",
    "test/test-app/config/routes.rb",
    "test/test-app/db/migrate/001_create_users.rb",
    "test/test-app/db/migrate/002_create_posts.rb",
    "test/test-app/public/404.html",
    "test/test-app/public/422.html",
    "test/test-app/public/500.html",
    "test/test-app/script/console",
    "test/test-app/script/generate",
    "test/test_helper.rb",
    "test/unit/user_test.rb",
    "funktional.gemspec"
  ]
  s.homepage = %q{http://github.com/brentgreeff/funktional}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Funktional", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{funktional}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Alternative test/unit framework}
  s.test_files = [
    "test/functional/users_controller_test.rb",
    "test/test_helper.rb",
    "test/unit/user_test.rb"
  ]
  
  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3
    
    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
