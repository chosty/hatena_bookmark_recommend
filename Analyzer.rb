require "fpgrowth"
require "pp"
require "./TestLoader.rb"

class Analyzer
	def initialize(loader)
		@loader = loader
		@tagging_history = @loader.load()
		@cooccurring_tagslist = assosiation_rule_mining(@tagging_history)
	end

	#共起度？の高いTagの組み合わせからランダムに一つ取得
	def sample
		return @cooccurring_tagslist.sample()
	end

	def assosiation_rule_mining(tag_transactions)
		fp_tree = FpGrowth::FpTree.build(tag_transactions)
		patterns = FpGrowth::Miner.td_fp_growth(fp_tree)
		tags = []
		patterns.each do |pattern|
			#出現頻度が1%以上かつ二個の組み合わせ
			if pattern.content.length == 2 && pattern.support > tag_transactions.length * 0.01
				tags.push(pattern.content)
			end
		end
		tags
	end
end
