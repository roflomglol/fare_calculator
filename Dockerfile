FROM ruby:2.4.2

RUN apt-get update && apt-get install -y sqlite3

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN gem install bundler

ARG RAILS_ENV=development

ENV RAILS_ENV ${RAILS_ENV}
ENV RAILS_LOG_TO_STDOUT true

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/

RUN bundle config --global frozen 1
RUN bundle install --without development test

COPY . /usr/src/app
RUN bundle exec rake db:setup
RUN bundle exec rake db:seed

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
