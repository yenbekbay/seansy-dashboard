# Seansy Dashboard

A simple dashboard built with [Dashing](http://shopify.github.io/dashing/). Features appstore stats (average rating), mixpanel analytics (event count and people count), pingdom status, and a custom stats widget.

Usage:
- Start by [installing Bundler](http://bundler.io) `sudo gem install bundler`
- `touch .env` and add the following constants: PINGDOM_API_KEY, PINGDOM_USER, PINGDOM_PASSWORD, MIXPANEL_API_KEY, MIXPANEL_API_SECRET, AUTH_TOKEN, where AUTH_TOKEN is the token you will use to push data to the dashboard
- `bundle install` and `dashing start`