#データ読み込み、解析、推薦のクラスをそれぞれ作る
require 'open-uri'
require 'rss/1.0'
require 'json'

class Loader

	attr_accessor :tag_count_list

	def initialize()
		@tag_count_list = Hash.new
	end

	def json_load
		json_data = open("test.json")
		json_data.each do |io|
			json = JSON.parser.new(io).parse()
			@tag_count_list[json["tag"]] = json["count"]
		end
	end

end

class Aanalyst
end

class Recommender

	attr_accessor :article_list

	def initialize()
		@article_list = Hash.new
	end

	#指定されたタグの記事一覧を取得してくる
	def get_article(tag)
		url = "http://b.hatena.ne.jp/search/tag?q=#{tag}&mode=rss&users=100"
		rss = open(url) do |file|
			RSS::Parser.parse(file.read)
		end
		rss.items.each do |item|
			@article_list[item.title] = item.link
		end
	end
end

class Main
end
