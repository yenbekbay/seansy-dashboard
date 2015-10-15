# Seansy Dashboard

A simple dashboard built with [Dashing](http://shopify.github.io/dashing/). Features appstore stats (average rating), mixpanel analytics (event count and people count), pingdom status, and a custom stats widget.

Usage:
- Start by [installing Bundler](http://bundler.io) `sudo gem install bundler`
- Add the following environment variables to your build: `PINGDOM_API_KEY`, `PINGDOM_USER`, `PINGDOM_PASSWORD`, `MIXPANEL_API_KEY`, `MIXPANEL_API_SECRET`, `AUTH_TOKEN`, where `AUTH_TOKEN` is the token you will use to push data to the dashboard. For heroku you can do `heroku config:set CONSTANT=value` for every constant.
- `bundle install` and `dashing start`
- Edit `dashboards/main.erb` to customize the layout of the main dashboard
- Change `APP_ID` and `APP_COUNTRY` in `jobs/app_store.rb` to show the stats for your app
- Edit `stats.erb` to customize the stats for your needs
