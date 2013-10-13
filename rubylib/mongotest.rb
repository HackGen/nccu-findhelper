require 'rubygems'  # not necessary for Ruby 1.9
require 'mongo'
include Mongo

@db = MongoClient.new("ec2-54-238-157-232.ap-northeast-1.compute.amazonaws.com").db("mydb")

#mongo_client.database_names     # lists all database names
#mongo_client.database_info.each { |info| puts info.inspect }

coll = @db.collection("hackGenData")

#doc = {"name" => "MongoDB", "type" => "database", "count" => 1, "info" => {"x" => 203, "y" => '102'}}
#doc = datav

puts coll.find({"id" => /^\d+/}, :fields => ["wid"]).to_a
#.each { |row| puts row.inspect }

#p @db.hackGenData.find()

#coll.find.each { |row| puts row.inspect }
