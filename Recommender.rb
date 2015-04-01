require 'open-uri'
require 'rss/1.0'
require 'URI'
require "./Analyzer.rb"

class Recommender
	attr_accessor :article_list, :query

	def initialize(cotags)
		@query = create_query(cotags)
	end

	#queryをつくる
	def create_query(cotags)
		return cotags.join("+")
	end

	#指定されたタグの記事一覧を取得してくる
	def get_article_list
		ret = {}
		url = "http://b.hatena.ne.jp/search/tag?q=#{@query}&mode=rss&users=10"
		url = URI.encode(url)
		rss = open(url) do |file|
			RSS::Parser.parse(file.read)
		end
		rss.items.each do |item|
			ret[item.title] = item.link
		end
		ret
	end

	#とりあえず一覧からランダムに記事のULRを返す
	def get_url
		get_article_list.values.sample.to_s
	end
end
