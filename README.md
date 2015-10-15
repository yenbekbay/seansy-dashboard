# Seansy Dashboard

A simple dashboard built with [Dashing](http://shopify.github.io/dashing/). Features appstore stats (average rating), mixpanel analytics (event count and people count), pingdom status, and a custom stats widget. You will need a mixpanel account with the "People" feature turned on and a Pingdom account with at least one check to use the mixpanel and pingdom widgets.

## Usage:
- Start by [installing Bundler](http://bundler.io) `sudo gem install bundler`
- `touch .env` and add the following environment variables: `PINGDOM_API_KEY`, `PINGDOM_USER`, `PINGDOM_PASSWORD`, `MIXPANEL_API_KEY`, `MIXPANEL_API_SECRET`, `AUTH_TOKEN`, where `AUTH_TOKEN` is the token you will use to push data to the dashboard.
- `bundle install` to install dependencies
- `dashing start` to check that everything was installed correctly
- Edit `dashboards/main.erb` to customize the layout of the main dashboard
- Change `PINGDOM_CHECK_ID`, `APP_ID`, and `APP_COUNTRY` in `config.ru`
- Edit `stats.erb` to customize the stats for your needs
- Don't forget to add the aforementioned constants to your production build. For heroku you can do `heroku config:set CONSTANT=value` for every constant.
