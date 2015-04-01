#オブジェクト指向よくわからん

require "./Loader.rb"
require "./Recommender.rb"
require "./Analyzer.rb"


class Main
	def initialize()
		@loader = Loader.new
		@analyzer = Analyzer.new()
		@recommender = Recommender.new()
	end

	def flow
		@loader.json_load()
		@analyzer.tag_transactions = @loader.tag_transactions
		tag = @analyzer.fp_growth()
		@recommender.get_article(tag)
		url = @recommender.recommend_article()
		`open -a "/Applications/Google Chrome.app" #{url}`
	end
end

main = Main.new
main.flow



