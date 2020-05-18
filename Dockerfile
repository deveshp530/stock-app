FROM ruby:2.6.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs yarn
RUN mkdir /myapp

WORKDIR /myapp


ADD ./Gemfile /myapp/Gemfile
ADD ./Gemfile.lock /myapp/Gemfile.lock

RUN bundle install
COPY . /myapp

ADD . /myapp

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
