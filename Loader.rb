require 'json'

class Loader
	attr_accessor :tag_transactions

	def initialize()
		@tag_transactions = Array.new
	end

	def json_load()
		json_data = open("test2.json")
		json_data.each do |io|
			@tag_transactions = JSON.parser.new(io).parse()
		end
	end
end
