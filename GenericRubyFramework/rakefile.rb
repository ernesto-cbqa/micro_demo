# sample command: bundle install && bundle exec rake spec[functional,parallel]
begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec, [:tags]) do |task, task_args|
    task.pattern = ['spec/**/*_spec.rb']
    tag_list = "--tag #{task_args.tags}" # first entry
    args = task_args.extras #subsequent entries
    puts args.inspect
    args.each do |entry|
      tag_list << " --tag #{entry}"
    end
    puts tag_list 
    task.rspec_opts = [tag_list, "--color", "--format documentation", "--format html --out report.html hello_world_spec.rb"]
  end
  
  task :default => :spec
  Rake::Task['spec'].execute
rescue LoadError
  # no rspec available on machine
end
