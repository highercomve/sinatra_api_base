# require File.join(File.dirname(__FILE__), 'app.rb')
# run NoNameApp

libs = File.expand_path "../", __FILE__
$LOAD_PATH.unshift libs unless $LOAD_PATH.include?(libs)

require File.expand_path "../app.rb", __FILE__

controllers = Dir.glob('app/controllers/**/*.rb')
controllers.each do |file|
  require file
end

controllers.each do |file|
  controller = File.basename(file, '.rb').split('_').map{|f| f.capitalize }.inject(:+)
  route = "/" + controller.sub(/Controller/,'').downcase
  map(route) { run Module.const_get controller }
end

map('/') { run App }
