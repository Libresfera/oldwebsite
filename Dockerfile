FROM ruby:latest
MAINTAINER Vicente Pons <simpons@gmail.com>

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN adduser --disabled-password --gecos "" rails

WORKDIR /home/rails/app
ADD Gemfile /home/rails/Gemfile

RUN bundle install
ADD . /home/rails/app

