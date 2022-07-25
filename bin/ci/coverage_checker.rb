require 'json'

puts JSON.parse(File.read('coverage/coverage.json')).dig('metrics', 'covered_percent')
