require 'open-uri'
require 'rss/1.0'
require 'URI'

class Recommender
	attr_accessor :article_list

	def initialize()
		@article_list = Hash.new
	end

	#指定されたタグの記事一覧を取得してくる
	#日本語タグだとエラー吐いてくる
	def get_article(tag)
		url = "http://b.hatena.ne.jp/search/tag?q=#{tag}&mode=rss&users=100"
		url = URI.encode(url)
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