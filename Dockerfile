FROM ruby:2.6.2
RUN apt-get update -qq && \
    apt-get install -y nano build-essential libpq-dev nodejs
RUN mkdir /rails_app
COPY ./rails_app/Gemfile ./rails_app/Gemfile.lock /rails_app/
WORKDIR /rails_app
RUN bundle install
COPY ./rails_app/ /rails_app/
# CMD puma
