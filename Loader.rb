require 'json'

class Loader
	attr_accessor :tag_count_list

	def initialize()
		@tag_count_list = Hash.new
	end

	def json_load()
		json_data = open("test.json")
		json_data.each do |io|
			json = JSON.parser.new(io).parse()
			@tag_count_list[json["tag"]] = json["count"]
		end
	end
end
