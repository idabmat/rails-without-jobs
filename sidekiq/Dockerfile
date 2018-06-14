FROM ruby:2.5-alpine

WORKDIR /sidekiq

COPY Gemfile* ./

RUN apk update \
 && apk upgrade \
 && bundle install

RUN addgroup -g 1000 -S sidekiq \
 && adduser -u 1000 -S sidekiq -G sidekiq \
 && chown -R sidekiq:sidekiq /sidekiq
USER sidekiq

CMD ["bundle", "exec", "sidekiq", "-r", "./worker.rb"]
