FROM ruby:2.7.6

ADD . /app
WORKDIR /app

RUN apt-get update
RUN apt-get install sqlite3
RUN bundle install -j4