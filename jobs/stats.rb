#!/usr/bin/env ruby
require 'httpclient'
require 'json'

client = HTTPClient.new

SCHEDULER.every '1h', :first_in => 0 do |job|
  showtimes_res = client.get("http://seansy.kz/api/showtimes")
  movies_res = client.get("http://seansy.kz/api/movies?filter[where][date]=null")
  theatres_res = client.get("http://seansy.kz/api/theatres")

  unless showtimes_res.status == 200
    raise "Couldn't load showtimes page (status-code: #{showtimes_res.status})\n#{showtimes_res.content}"
  end

  unless movies_res.status == 200
    raise "Couldn't load movies page (status-code: #{movies_res.status})\n#{movies_res.content}"
  end

  unless theatres_res.status == 200
    raise "Couldn't load theatres page (status-code: #{theatres_res.status})\n#{theatres_res.content}"
  end

  showtimes = JSON.parse(showtimes_res.content)
  movies = JSON.parse(movies_res.content)
  theatres = JSON.parse(theatres_res.content)

  data = {
    showtimes_count: showtimes.length,
    movies_count: movies.length,
    theatres_count: theatres.length
  }

  send_event('stats', data)
end
