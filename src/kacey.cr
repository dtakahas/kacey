require "./kacey/*"
require "yaml"
include Kacey

puts "Clusters:"

f = File.read("/Users/davetakahashi/.kube/config")
data = YAML.parse(f)

data["clusters"].each_with_index do |cluster, i|
  puts "#{i + 1}. #{cluster["name"]}"
end

puts "\n"

puts "Contexts:"

data["contexts"].each_with_index do |context, i|
  puts "#{i + 1}. #{context["name"]} (cluster: #{context["context"]["cluster"]})"
end

puts "\n"

puts "Select context: "

selection = gets || "none"

if selection == "none"
  puts "Exiting"
else
  puts data["contexts"][selection.to_i - 1]
end
