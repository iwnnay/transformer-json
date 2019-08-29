#!/usr/bin/env ruby
require 'csv'
require 'json'

data = CSV.read("Transformers.csv", headers: true)
json = []
count = 0

data.each do |row|
  break if count >= 250
  name = row[0].sub(/^-/, '')
  this_json = {}
  this_json[:first_name] = name # row['Name'] isn't working for some reason
  this_json[:organization] = row['Series']
  this_json[:email] = "#{name.downcase}@#{row['Continuity'].downcase}.com"
  p row
  p this_json

  json << this_json
  count += 1
end

p "Total count #{json.count}"

File.open('transformers.json', 'w') do |f|
  f.puts json.to_json
end
