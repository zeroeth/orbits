require 'rake'
require 'rake/testtask'
Rake::TestTask.new do |t|
  t.libs << "test"
  t.libs << "."
  t.options = "-v"
  t.test_files = FileList['test/*test.rb']
  t.verbose = true
end

