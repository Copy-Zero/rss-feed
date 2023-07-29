require 'rss'
require 'open-uri'
require 'date'

def format_post_date(date)
  # date = DateTime.parse(rss_date)
  "#{date.day}-#{Date::MONTHNAMES[date.month]}-#{date.year}"
end

def get_main_episodes(episodes)
  main_episodes = []
  episodes.each do |episode|
    main_episodes << [episode.title, format_post_date(episode.pubDate)] if episode.title.include? 'Episode'
  end
  main_episodes
end

def recent_five(episodes)
  puts '=================== Top Five ===================='
  5.times do |index|
    puts episodes[index][0]
    puts episodes[index][1]
  end
end

def search_episodes(episodes)
  puts '===================== Search ====================='
  puts 'Enter Search string: '
  search = gets.chomp

  puts(episodes.select { |episode| episode[0].include? search })
end

lpotl_url = 'http://feeds.feedburner.com/TheLastPodcastOnTheLeft'
URI.open(lpotl_url) do |rss|
  feed = RSS::Parser.parse(rss)
  puts "Title: #{feed.channel.title}"
  main_episodes = get_main_episodes(feed.items)

  # menu
  puts 'LPOTL RSS Feed  ------'
  puts '  Option 1: 5 Most Recent Episodes'
  puts '  Option 2: Search in episode titles'

  user_choice = gets.chomp

  recent_five(main_episodes) if user_choice == '1'
  search_episodes(main_episodes) if user_choice == '2'
  # feed.items.each do |item|
  # puts "Item: #{item.title}"
  # end
end

