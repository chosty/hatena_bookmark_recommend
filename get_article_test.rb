require 'open-uri'
require 'rss/1.0'

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

	def recommend_article()
		title = @article_list.keys.shuffle[0]
		return "#{title}, #{@article_list[title]}"
	end

end

rec = Recommender.new
rec.get_article("ruby")
rec.article_list()
puts rec.recommend_article()
