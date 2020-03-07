FROM ruby:2.6.3-buster AS development

WORKDIR /usr/src/gems

ENV HOME=/usr/src PATH=/usr/src/bin:$PATH

# Copy all files required to run "bundle install":
# Copy the SDK core library dependency files:
COPY gems/core/Gemfile \
     gems/core/Gemfile.lock \
     gems/core/icalia-sdk-core.gemspec \
     /usr/src/gems/core/
COPY gems/core/lib/icalia-sdk-core/version.rb \
     /usr/src/gems/core/lib/icalia-sdk-core/

# Copy the Event Notification SDK library dependency files:
COPY gems/event-notification/Gemfile \
     gems/event-notification/Gemfile.lock \
     gems/event-notification/icalia-sdk-event-notification.gemspec \
     /usr/src/gems/event-notification/
COPY gems/event-notification/lib/icalia-sdk-event-notification/version.rb \
     /usr/src/gems/event-notification/lib/icalia-sdk-event-notification/

# Copy the Event Webhook SDK library dependency files:
COPY gems/event-webhook/Gemfile \
     gems/event-webhook/Gemfile.lock \
     gems/event-webhook/icalia-sdk-event-webhook.gemspec \
     /usr/src/gems/event-webhook/
COPY gems/event-webhook/lib/icalia-sdk-event-webhook/version.rb \
     /usr/src/gems/event-webhook/lib/icalia-sdk-event-webhook/

# Copy the Event SDK meta library dependency files:
COPY gems/event/Gemfile \
     gems/event/Gemfile.lock \
     gems/event/icalia-sdk-event.gemspec \
     /usr/src/gems/event/
COPY gems/event/lib/icalia-sdk-event/version.rb \
     /usr/src/gems/event/lib/icalia-sdk-event/

# Copy the SDK meta library dependency files:
COPY gems/sdk/Gemfile \
     gems/sdk/Gemfile.lock \
     gems/sdk/icalia-sdk.gemspec \
     /usr/src/gems/sdk/
COPY gems/sdk/lib/icalia-sdk/version.rb \
     /usr/src/gems/sdk/lib/icalia-sdk/

# Step X: Install all ruby library dependencies
RUN for dir in core event-notification event-webhook event sdk; do \
  cd $dir ; \
  bundle install --jobs=4 --retry=3 ; \
  cd .. ; \
  done

# Stage II: Testing:
FROM development AS testing

COPY . /usr/src/
