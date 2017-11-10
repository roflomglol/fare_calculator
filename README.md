# Fares Calculator

Fares calculator uses latitude and longitude for two points and estimates fare. Written on Ruby, uses Ruby on Rails framework and gRPC protocol for communications with [Estimator](https://github.com/roflomglol/estimator) service.

## Getting Started

You can start the development server like this:

```bundler exec rails s```

Or, use Docker:

```docker run -p 3000:3000 -d -e ESTIMATOR_API= image```

And try this, for example:

```curl localhost:3000/fares/moscow/business/estimate\?origin\=55.719022,37.407395\&destination\=55.866873,37.708217```

Please keep in mind that you need to setup ESTIMATOR_API environment variable before you start the server.

### Prerequisites

Fares Calculator uses [Estimator](https://github.com/roflomglol/estimator) for getting data about route, so make sure you got Estimator up and running before you start the server.

### Installing

Make sure you install gems and setup db before first use:

Bundle gems:
```
bundle install
```

Setup database. It uses SQLite3, so it shouldn't be a problem. Don't forget to seed data to get you started.

```
bundle exec rake db:setup
bundle exec rake db:seed
```

### NOTES

Exercise, please ignore.
