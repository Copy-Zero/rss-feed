require "rss"
require "open-uri"

def get_main_episodes(episodes)
  main_episodes = []
  episodes.each do |episode|
    if episode.title.include? "Episode"
      main_episodes << [episode.title, episode.pubDate]
    end
  end
  main_episodes
end

lpotl_url = "http://feeds.feedburner.com/TheLastPodcastOnTheLeft"
URI.open(lpotl_url) do |rss|
  feed = RSS::Parser.parse(rss)
  puts "Title: #{feed.channel.title}"
  main_epsisodes = get_main_episodes(feed.items)
  5.times do |index|
    puts main_epsisodes[index][0]
    puts main_epsisodes[index][1]
    
  end

  # feed.items.each do |item|
  # puts "Item: #{item.title}"
  # end
end
