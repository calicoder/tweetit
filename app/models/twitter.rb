require "twitter"
require "awesome_print"

class TweetIt
  CONSUMER_KEY = "v0Qlzb01LQBaxEF3WDCbPQ"
  CONSUMER_SECRET = "Bhwg1KGyPYpii24Bwv9bUzZeYJGeEO8mHmeniR7w"

  def initialize
    @twitter = Twitter::Client.new(
        :consumer_key => CONSUMER_KEY,
        :consumer_secret => CONSUMER_SECRET,
        :oauth_token => "108174289-nsl3lotLWNQSJkzk6e9ffxaZJFVHdkHKpUkDJufd",
        :oauth_token_secret => "qdAks84WoI5BeVVjrecVpSrEWOZ9OEpGJE2Xfl9c"
    )
  end

  def tweet(message)
    @twitter.update(message)
  end

  def followers_for(handle)
    @twitter.followers(handle)
  end
end


MIN_TWEET_COUNT = 10
MIN_FOLLOWER_COUNT = 10
MAX_ATTEMPTS = 3
num_attempts = 0

twitter = TweetIt.new()
will_follow = 0
begin
  num_attempts += 1
  followers = twitter.followers_for("therealreal")
  followers.each do |follower|
    puts follower.inspect

    puts "name"
    name = follower["name"]
    puts name

    puts "follower_count"
    followers_count = follower["followers_count"]
    puts followers_count

    puts "friends_count"
    friends_count = follower["friends_count"]
    puts friends_count

    puts "statuses_count"
    tweet_count = follower["statuses_count"]
    puts tweet_count

    puts "following?"
    following = follower["following"]
    puts following

    puts "follow_request_sent?"
    follow_request_sent = follower["follow_request_sent"]
    puts follow_request_sent

    if tweet_count > 10
      will_follow += 1
    end

    puts "----"
  end
rescue Twitter::Error::TooManyRequests => error
  #if num_attempts <= MAX_ATTEMPTS
  #  sleep error.rate_limit.reset_in
  #  retry
  #else
    raise
  #end
end

puts 'will follow'
puts will_follow





