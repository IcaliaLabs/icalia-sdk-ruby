FROM ruby:2.6.3-alpine AS testing

RUN apk add --no-cache git