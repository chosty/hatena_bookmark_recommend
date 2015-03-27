#データ読み込み、解析、推薦のクラスをそれぞれ作る
require 'open-uri'
require 'rss/1.0'
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

class Aanalyst
	attr_accessor :tag_count_list

	def initialize(hoge)
		@tag_count_list = hoge
	end

	def tag()
		#return @tag_count_list.keys.shuffle[0]
		return "ruby"
	end
end

class Recommender

	attr_accessor :article_list

	def initialize()
		@article_list = Hash.new
	end

	#指定されたタグの記事一覧を取得してくる
	#日本語タグだとエラー吐いてくる
	def get_article(tag)
		url = "http://b.hatena.ne.jp/search/tag?q=#{tag}&mode=rss&users=100"
		rss = open(url) do |file|
			RSS::Parser.parse(file.read)
		end
		rss.items.each do |item|
			@article_list[item.title] = item.link
		end
	end

	#とりあえず一覧からランダムに記事を出す
	def recommend_article()
		title = @article_list.keys.shuffle[0]
		return "#{title}, #{@article_list[title]}"
	end

end

#オブジェクト指向よくわからん
class Main
	def flow
		loader = Loader.new
		loader.json_load()
		analyst = Aanalyst.new(loader.tag_count_list())
		analyst.tag_count_list
		tag = analyst.tag()
		recommender = Recommender.new()
		recommender.get_article(tag)
		puts recommender.recommend_article()
	end
end

main = Main.new
main.flow




