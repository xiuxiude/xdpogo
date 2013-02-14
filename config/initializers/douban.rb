Douban.configure do |config|
  config.client_id = ENV['DOUBAN_API_KEY']
  config.client_secret = ENV['DOUBAN_API_SECRET']
end