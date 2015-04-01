#オブジェクト指向よくわからん

require "./Loader.rb"
require "./Recommender.rb"
require "./Aanalyst.rb"


class Main
	def initialize()
		@loader = Loader.new
		@analyst = Aanalyst.new()
		@recommender = Recommender.new()
	end

	def flow
		@loader.json_load()
		@analyst.tag_count_list = @loader.tag_count_list()
		@tag = @analyst.tag()
		@recommender.get_article(@tag)
		url = @recommender.recommend_article()
		`open -a "/Applications/Google Chrome.app" #{url}`
	end
end

main = Main.new
main.flow



