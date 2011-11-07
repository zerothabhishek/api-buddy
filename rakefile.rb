
namespace :apibuddy do
  
  task :init do
    require './api_buddy.rb'
  end
  
  task :work => [:init] do
    ApiBuddy::Listener.run
  end
  
  task :test_init => [:init] do
    require File.expand_path('../tests/test_data.rb', __FILE__)
  end
  
  task :test => [:test_init] do
    ApiBuddy::Listener.run
  end
end