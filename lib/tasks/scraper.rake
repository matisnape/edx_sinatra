require_relative '../scrape_holidays'

namespace :scraper do
  desc "Scrapes a page and saves parsed contents to file"

  task :run do
    ClosedDays::ScrapeHolidays.new.run!
  end

  task :cleanup_directory do
    dir = Dir['lib/scraped/*']
    if dir.size > 2
      dir[0..-3].each do |file_path|
        File.delete(file_path) if File.exist?(file_path)
      end
    end
  end
end
