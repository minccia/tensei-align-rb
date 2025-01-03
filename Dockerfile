FROM ruby:3.4.1 AS final 

WORKDIR /usr/src/

COPY Gemfile . 

RUN bundle install 

COPY . . 