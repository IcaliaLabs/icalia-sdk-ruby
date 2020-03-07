FROM ruby:2.6.3-buster AS development

WORKDIR /usr/src

ENV HOME=/usr/src PATH=/usr/src/bin:$PATH

COPY Gemfile Gemfile.lock /usr/src/
RUN bundle install --jobs=4 --retry=3

# Copy all files required to run "bundle install":
# Copy the SDK core library dependency files:
COPY core/Gemfile \
     core/Gemfile.lock \
     core/icalia-sdk-core.gemspec \
     /usr/src/core/
COPY core/lib/icalia-sdk-core/version.rb \
     /usr/src/core/lib/icalia-sdk-core/

# Copy the Event Notification SDK library dependency files:
COPY event-notification/Gemfile \
     event-notification/Gemfile.lock \
     event-notification/icalia-sdk-event-notification.gemspec \
     /usr/src/event-notification/
COPY event-notification/lib/icalia-sdk-event-notification/version.rb \
     /usr/src/event-notification/lib/icalia-sdk-event-notification/

# Copy the Event Webhook SDK library dependency files:
COPY event-webhook/Gemfile \
     event-webhook/Gemfile.lock \
     event-webhook/icalia-sdk-event-webhook.gemspec \
     /usr/src/event-webhook/
COPY event-webhook/lib/icalia-sdk-event-webhook/version.rb \
     /usr/src/event-webhook/lib/icalia-sdk-event-webhook/

# Copy the Event SDK meta library dependency files:
COPY event/Gemfile \
     event/Gemfile.lock \
     event/icalia-sdk-event.gemspec \
     /usr/src/event/
COPY event/lib/icalia-sdk-event/version.rb \
     /usr/src/event/lib/icalia-sdk-event/

# Copy the SDK meta library dependency files:
COPY sdk/Gemfile \
     sdk/Gemfile.lock \
     sdk/icalia-sdk.gemspec \
     /usr/src/sdk/
COPY sdk/lib/icalia-sdk/version.rb \
     /usr/src/sdk/lib/icalia-sdk/

# Step X: Install all ruby library dependencies
RUN for dir in core event-notification event-webhook event sdk; do \
  cd $dir ; \
  bundle install --jobs=4 --retry=3 ; \
  cd .. ; \
  done

# Stage II: Testing:
FROM development AS testing

COPY . /usr/src/
