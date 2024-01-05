# What is this?

This is a small example project that demonstrates an issue with Honeybadger not reporting failed jobs on Solid Queue.

# How to use?

## Prerequisites

* Clone this repo and follow the [Getting Started](https://guides.rubyonrails.org/getting_started.html#what-s-next-questionmark) guide for Ruby on Rails up to step 4.1. Verify that you can run the app locally.
* Install Redis and start it on the default port, i.e. `brew install redis && brew services start redis`
* Configure Honeybadger by setting the `HONEYBADGER_API_KEY` environment variable to your Honeybadger API key.

## Steps

### Test Sidekiq - should report error

1. Set `config.active_job.queue_adapter` to `:sidekiq` in `config/environments/development.rb`.
2. Run `bin/rails server` to start the Rails server.
3. Run `bundle exec sidekiq` to start the Sidekiq worker.
4. Go to http://localhost:3000/ and inspect your Honeybadger dashboard. You should see an error reported.

### Test Solid Queue - should not report error

1. Set `config.active_job.queue_adapter` to `:solid_queue` in `config/environments/development.rb`.
2. Run `bin/rails server` to start the Rails server.
3. Run `bundle exec rake solid_queue:start` to start the Solid Queue worker.
4. Go to http://localhost:3000/ and inspect your Honeybadger dashboard. Error won't be reported.
