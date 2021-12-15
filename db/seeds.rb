# require 'active_record'

Dir[File.dirname(__FILE__) + '/seeds/*.rb'].sort.each do |file|
  puts "Seeds #{file} ..."
  require file
end

PreloadedChecklist.call
