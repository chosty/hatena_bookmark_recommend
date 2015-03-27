class Aanalyst
	attr_accessor :tag_count_list

	def initialize()
		@tag_count_list = Hash.new
	end

	#とりあえずランダムにタグ渡す
	def tag()
		return @tag_count_list.keys.shuffle[0]
	end
end
