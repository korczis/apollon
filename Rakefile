desc 'Get all tasks'
task :tasklist do
	puts Rake.application.tasks
end

task :usage do
  puts "No rake task specified so listing them ..."
  Rake.application['tasklist'].invoke
end

desc 'Prepare required vagrant dependencies on local machine'
task :prepare do
  exec 'vagrant plugin install vagrant-digitalocean'
end

# task :default => [:usage]

if $0 == __FILE__
	Rake.application['usage'].invoke
end