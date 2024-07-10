FROM ruby:3.3.4

RUN curl -fsSL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get update && apt-get install -y --no-install-recommends \
    python python3 build-essential libpq-dev libmariadb-dev sqlite3 libsqlite3-dev nodejs
RUN npm install -g yarn

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install --without development test

COPY . .
# RUN npm rebuild node-sass
RUN SECRET_KEY_BASE="assets_compile" bundle exec rails assets:precompile

# hack to mount the config (writeable) as a volume
RUN mkdir -p /state && ln -s /usr/bin/app/config/aylamusica.yml /state/

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
