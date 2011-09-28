namespace :apibuddy
  task :work => [:environment] do
    ApiBuddy::Processor.run
  end
end