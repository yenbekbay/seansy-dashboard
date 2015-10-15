# Seansy Dashboard [ ![Codeship Status for yenbekbay/seansy-dashboard](https://codeship.com/projects/1b67c340-5532-0133-6699-26e6b5453efb/status?branch=master)](https://codeship.com/projects/108913)

A simple dashboard built with [Dashing](http://shopify.github.io/dashing/). Features appstore stats (average rating), mixpanel analytics (event count and people count), pingdom status, and a custom stats widget.

Usage:
- Start by [installing Bundler](http://bundler.io) `sudo gem install bundler`
- `touch .env` and add the following constants: `PINGDOM_API_KEY`, `PINGDOM_USER`, `PINGDOM_PASSWORD`, `MIXPANEL_API_KEY`, `MIXPANEL_API_SECRET`, `AUTH_TOKEN`, where `AUTH_TOKEN` is the token you will use to push data to the dashboard
- `bundle install` and `dashing start`
- Edit `dashboards/main.erb` to customize the layout of the main dashboard
- Change `APP_ID` and `APP_COUNTRY` in `jobs/app_store.rb` to show the stats for your app
- Edit `stats.erb` to customize the stats for your needs
