# Seansy Dashboard

A simple dashboard built with [Dashing](http://shopify.github.io/dashing/). Features App Store stats (average rating), Mixpanel analytics (event count and people count), Pingdom status, and a custom stats widget. You will need a Mixpanel account with the "People" feature turned on and a Pingdom account with at least one check to use the Mixpanel and Pingdom widgets.

## Usage
- Start by [installing Bundler](http://bundler.io) `sudo gem install bundler`
- `touch .env` and add the following environment variables: `PINGDOM_API_KEY`, `PINGDOM_USER`, `PINGDOM_PASSWORD`, `MIXPANEL_API_KEY`, `MIXPANEL_API_SECRET`, `AUTH_TOKEN`, where `AUTH_TOKEN` is the token you will use to push data to the dashboard. You can generate `AUTH_TOKEN` with 1Password or whatever other password service you use.
- `bundle install` to install dependencies
- `dashing start` to check that everything was installed correctly
- Edit `dashboards/main.erb` to customize the layout of the main dashboard
- Change `PINGDOM_CHECK_ID`, `APP_STORE_ID`, and `APP_STORE_COUNTRY` in `config.ru`
- Edit `jobs/stats.erb`, `widgets/stats/stats.coffee`, `widgets/stats/stats.html`, and `widgets/stats/stats.scss` to customize the stats widget for your needs
- Don't forget to add the aforementioned constants to your production build. For heroku you can do `heroku config:set CONSTANT=value` for every constant.

## Sending Custom Stats to Your Dashboard
If you use node.js, check out [dashing client](https://github.com/benbria/dashing-client). With dashing client you can do:
```js
DashingClient = require('dashing-client');

dashing = new DashingClient('http://localhost:3030', "AUTH_TOKEN");
dashing.send('stats', {
  firstParam: "text",
  secondParam: "text",
  thirdParam: "text"
}, function(err, resp, body) {
    // Callback
});
```
For Parse cloud you do:
```js
Parse.Cloud.httpRequest({
    url: 'http://localhost:3030/widgets/stats',
    method: 'POST',
    body: {
      auth_token: "AUTH_TOKEN"
      firstParam: "text",
      secondParam: "text",
      thirdParam: "text"
    },
    success: function (httpResponse) {
        // Success callback
    },
    error:function (httpResponse) {
        // Error callback
    }
});
```
Otherwise, you can send data using curl:
```sh
curl -d '{ "auth_token": "AUTH_TOKEN", "firstParam": "text", "secondParam": "text", "thirdParam": "text" }' http://localhost:3030/widgets/stats
```

> Note: to edit the parameters you want to send to your stats widget, edit `jobs/stats.erb`, `widgets/stats/stats.coffee`, `widgets/stats/stats.html`, and `widgets/stats/stats.scss`
