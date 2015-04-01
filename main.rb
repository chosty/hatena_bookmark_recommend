#オブジェクト指向よくわからん

require "./Recommender.rb"
require "./Analyzer.rb"
require "./TestLoader.rb"

url = Recommender.new(Analyzer.new(TestLoader.new).sample).get_url
`open -a "/Applications/Google Chrome.app" #{url}`
