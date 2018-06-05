require "./kacey/*"
require "yaml"
include Kacey

puts "Clusters:"

f = File.read("/Users/davetakahashi/.kube/config")
data = YAML.parse(f)

data["clusters"].each do |cluster|
  puts cluster["name"]
end

puts "\n"

puts "Contexts:"

data["contexts"].each do |context|
  puts context["name"]
  puts context["context"]["cluster"]
end
