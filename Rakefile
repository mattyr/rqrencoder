require 'bundler'
Bundler::GemHelper.install_tasks

require 'rake/extensiontask'
Rake::ExtensionTask.new("RQREncoder") do |extension|
  extension.lib_dir = "lib/rqrencoder"
end

desc "clean and compile"
task :recompile => [:clean, :swig, :compile]

desc "remake swig wrapper"
task :swig do
	`swig -ruby ext/rqrencoder/RQREncoder.i`
end
