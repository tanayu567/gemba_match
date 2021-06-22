FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y nodejs yarn chromium-driver
RUN mkdir /gemba_match
WORKDIR /gemba_match
COPY Gemfile /gemba_match/Gemfile
COPY Gemfile.lock /gemba_match/Gemfile.lock
RUN gem install bundler
RUN bundle install
COPY . /gemba_match
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]