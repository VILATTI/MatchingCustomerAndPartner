FROM ruby:2.7.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /app
WORKDIR /app
COPY ./Gemfile /app/Gemfile
COPY ./Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app
RUN rm -rf /app/tmp/
ADD ./app-init.sh /app-init.sh
EXPOSE 3000 25
ENTRYPOINT /app-init.sh
