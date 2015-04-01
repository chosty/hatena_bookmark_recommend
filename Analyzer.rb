require "fpgrowth"
require "pp"

class Analyzer
	attr_accessor :tag_transactions

	def initialize()
		@tag_transactions = Array.new
	end

	#タグ付け回数上位10件の中からランダムでタグを返す
	#def tag()
		#tag_list = @tag_count_list.sort {|(k1, v1), (k2, v2)| v2 <=> v1 }
		#tag_list = Hash[tag_list]
		#tag = tag_list.keys.take(10).sample()
		#return tag
	#end

	def fp_growth()
		tags = Array.new()
		fp_tree = FpGrowth::FpTree.build(tag_transactions)
		patterns = FpGrowth::Miner.td_fp_growth(fp_tree)
		patterns.each do |pattern|
			#出現頻度が1%以上かつ二個の組み合わせ
			if pattern.content.length == 2 && pattern.support > @tag_transactions.length * 0.01
				tags.push(pattern.content)
			end
		end
		return tags.sample()
	end
end
