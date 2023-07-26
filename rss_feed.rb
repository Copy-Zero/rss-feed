require "rss"
require "open-uri"

lpotl_url = "http://feeds.feedburner.com/TheLastPodcastOnTheLeft"
URI.open(lpotl_url) do |rss|
  feed = RSS::Parser.parse(rss)
  puts "Title: #{feed.channel.title}"
  feed.items.each do |item|
    puts "Item: #{item.title}"
  end
end
