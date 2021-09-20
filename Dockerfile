FROM ruby:3.0.1-alpine

RUN apk add --update --no-cache  --virtual run-dependencies \
build-base \
postgresql-client \
postgresql-dev \
yarn \
git \
tzdata \
libpq \
&& rm -rf /var/cache/apk/*

WORKDIR /moar-api

ENV BUNDLE_PATH /gems

COPY Gemfile Gemfile.lock /moar-api/
RUN bundle install

COPY . /moar-api/

ENTRYPOINT ["bin/rails"]
CMD ["s", "-b", "0.0.0.0"]

EXPOSE 3000