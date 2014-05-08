desc 'Get all tasks'
task :tasklist do
	puts Rake.application.tasks
end

task :usage do
  puts "No rake task specified so listing them ..."
  Rake.application['tasklist'].invoke
end

task :default => [:usage]

if $0 == __FILE__
	Rake.application['usage'].invoke
end