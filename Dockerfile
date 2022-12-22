FROM ruby:2.7.6

ADD . /app
WORKDIR /app

RUN bundle install -j4