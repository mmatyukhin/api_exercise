FROM ruby:2.6.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /myapp
WORKDIR /myapp

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
COPY package.json /src/package.json
COPY yarn.lock /src/yarn.lock


RUN gem install bundler -v "~>2.0"
RUN bundle install
RUN apt install yarn -y

COPY . /myapp
