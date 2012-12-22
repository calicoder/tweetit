config_file = "#{::Rails.root.to_s}/config/twitter.yml"
TWITTER = YAML.load(ERB.new(File.read(config_file)).result)[::Rails.env]

Twitter.configure do |config|
  config.consumer_key = TWITTER["consumer_key"]
  config.consumer_secret = TWITTER["consumer_secret"]
end

