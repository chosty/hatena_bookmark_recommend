require 'json'
require "pp"
require "./Loader.rb"

class TestLoader < Loader
	def initialize
		@tagging_history = []
	end

	def load
		json_data = open("test2.json")
		json_data.each do |io|
			@tagging_history = JSON.parser.new(io).parse()
		end
		@tagging_history
	end
end
