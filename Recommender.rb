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
	#encodeして解決した(はず)
	def get_article(tag)
		if tag.kind_of?(Array)
			tag = tag.join("+")
		end
		url = "http://b.hatena.ne.jp/search/tag?q=#{tag}&mode=rss&users=10"
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
		title = @article_list.keys.sample()
		return "#{@article_list[title]}"
	end
end
