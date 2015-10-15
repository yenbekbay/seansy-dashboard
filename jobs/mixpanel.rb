require 'mixpanel_client'
require 'date'

root = ::File.dirname(__FILE__)
require ::File.join(root, "..", 'lib', 'mixpanel_event_number')

today_users = 0
yesterday_users = 0
last_date = Date.today

SCHEDULER.every '20s', :first_in => 0 do |job|
  if last_date == (Date.today - 1)
    yesterday_users = today_users
  end
  today_users = number_for_users(1)
  send_event('mixpanel_users_today', {
    current: today_users,
    last: yesterday_users
  })
end
