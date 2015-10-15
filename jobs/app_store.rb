#!/usr/bin/env ruby
require 'httpclient'
require 'json'

# Get info from the App Store of your App:
# Last version Average and Voting
# All time Average and Voting
#
# This job will track average vote score and number of votes
# of your App by scraping the App Store website.

appId = ENV['APP_STORE_ID']
appCountry = ENV['APP_STORE_COUNTRY']

client = HTTPClient.new

SCHEDULER.every '30m', :first_in => 0 do |job|
  res = client.get("http://itunes.apple.com/lookup?id=#{appId}&country=#{appCountry}")

  if res.status != 200
    puts "App Store store website communication (status-code: #{res.status})\n#{res.content}"
  else
    data = {
      :last_version => {
        average_rating: 0.0,
        voters_count: 0
      },
      :all_versions => {
        average_rating: 0.0,
        voters_count: 0
      }
    }
    result = JSON.parse(res.content)['results'][0]

    data[:last_version][:average_rating] = result['averageUserRatingForCurrentVersion']
    data[:last_version][:voters_count] = result['userRatingCountForCurrentVersion']
    data[:all_versions][:average_rating] = result['averageUserRating']
    data[:all_versions][:voters_count] = result['userRatingCount']

    send_event('app_store_rating', data)
  end
end
