#オブジェクト指向よくわからん

require "./Recommender.rb"

url = Recommender.new(Analyzer.new(TestLoader.new).sample).get_url
`open -a "/Applications/Google Chrome.app" #{url}`
