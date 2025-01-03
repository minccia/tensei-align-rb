FROM ruby:latest AS final 

COPY Gemfile . 

RUN bundle install 

COPY . . 