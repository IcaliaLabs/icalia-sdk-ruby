FROM ruby:2.6.3-alpine AS development

# Copy all files required to run "bundle install":

# Copy the Event SDK core library dependency files:
COPY gems/icalia-sdk-event-core/Gemfile \
     gems/icalia-sdk-event-core/Gemfile.lock \
     gems/icalia-sdk-event-core/icalia-sdk-event-core.gemspec \
     /usr/src/gems/icalia-sdk-event-core/
COPY gems/icalia-sdk-event-core/lib/icalia-sdk-event-core/version.rb \
     /usr/src/gems/icalia-sdk-event-core/lib/icalia-sdk-event-core/

# Copy the Event Notification SDK library dependency files:
COPY gems/icalia-sdk-event-notification/Gemfile \
     gems/icalia-sdk-event-notification/Gemfile.lock \
     gems/icalia-sdk-event-notification/icalia-sdk-event-notification.gemspec \
     /usr/src/gems/icalia-sdk-event-notification/
COPY gems/icalia-sdk-event-notification/lib/icalia-sdk-event-notification/version.rb \
     /usr/src/gems/icalia-sdk-event-notification/lib/icalia-sdk-event-notification/

# Copy the Event Webhook SDK library dependency files:
COPY gems/icalia-sdk-event-webhook/Gemfile \
     gems/icalia-sdk-event-webhook/Gemfile.lock \
     gems/icalia-sdk-event-webhook/icalia-sdk-event-webhook.gemspec \
     /usr/src/gems/icalia-sdk-event-webhook/
COPY gems/icalia-sdk-event-webhook/lib/icalia-sdk-event-webhook/version.rb \
     /usr/src/gems/icalia-sdk-event-webhook/lib/icalia-sdk-event-webhook/

# Copy the Event SDK meta library dependency files:
COPY gems/icalia-sdk-event/Gemfile \
     gems/icalia-sdk-event/Gemfile.lock \
     gems/icalia-sdk-event/icalia-sdk-event.gemspec \
     /usr/src/gems/icalia-sdk-event/
COPY gems/icalia-sdk-event/lib/icalia-sdk-event/version.rb \
     /usr/src/gems/icalia-sdk-event/lib/icalia-sdk-event/

# Copy the SDK meta library dependency files:
COPY gems/icalia-sdk/Gemfile \
     gems/icalia-sdk/Gemfile.lock \
     gems/icalia-sdk/icalia-sdk.gemspec \
     /usr/src/gems/icalia-sdk/
COPY gems/icalia-sdk/lib/icalia-sdk/version.rb \
     /usr/src/gems/icalia-sdk/lib/icalia-sdk/

WORKDIR /usr/src

# Step X: Install all ruby library dependencies
RUN cd gems/icalia-sdk && bundle install --jobs=4 --retry=3

# Stage II: Testing:
FROM development AS testing

COPY . /usr/src/
