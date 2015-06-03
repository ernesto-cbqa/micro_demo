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
    task.rspec_opts = [tag_list, "--color", "--format documentation", "--format RspecHtmlFormatter --out report.html"]
  end
  
  namespace :rspec_report do
    desc 'Run all specs and generate RSpec report in HTML'
    task :html => :spec
  end
  
  #task :default => :spec
rescue LoadError
  # no rspec available on machine
end
