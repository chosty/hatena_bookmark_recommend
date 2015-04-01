class Analyzer
	attr_accessor :tag_count_list

	def initialize()
		@tag_frequency = Hash.new
	end

	#タグ付け回数上位10件の中からランダムでタグを返す
	def tag()
		tag_list = @tag_count_list.sort {|(k1, v1), (k2, v2)| v2 <=> v1 }
		tag_list = Hash[tag_list]
		tag = tag_list.keys.take(10).shuffle[0]
		return tag
	end
end
