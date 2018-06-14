FROM ruby:2.5-alpine

WORKDIR /api

COPY Gemfile* ./

RUN apk update \
 && apk upgrade \
 && apk add --no-cache postgresql-dev tzdata\
 && apk add --virtual .build-dependencies g++ make libffi-dev libxml2-dev zlib-dev libxslt-dev \
 && bundle install \
 && apk del .build-dependencies


RUN addgroup -g 1000 -S api \
 && adduser -u 1000 -S api -G api \
 && chown api:api /api
USER api

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s"]
