FROM ruby:2.6.3-buster AS development

WORKDIR /workspaces/icalia-sdk

ENV PATH=/workspaces/icalia-sdk/bin:$PATH

COPY Gemfile Gemfile.lock /workspaces/icalia-sdk/
RUN bundle install --jobs=4 --retry=3

# Copy all files required to run "bundle install":
# Copy the SDK core library dependency files:
COPY core/Gemfile \
     core/Gemfile.lock \
     core/icalia-sdk-core.gemspec \
     /workspaces/icalia-sdk/core/
COPY core/lib/icalia-sdk-core/version.rb \
     /workspaces/icalia-sdk/core/lib/icalia-sdk-core/

# Copy the Event Notification SDK library dependency files:
COPY event-notification/Gemfile \
     event-notification/Gemfile.lock \
     event-notification/icalia-sdk-event-notification.gemspec \
     /workspaces/icalia-sdk/event-notification/
COPY event-notification/lib/icalia-sdk-event-notification/version.rb \
     /workspaces/icalia-sdk/event-notification/lib/icalia-sdk-event-notification/

# Copy the Event Webhook SDK library dependency files:
COPY event-webhook/Gemfile \
     event-webhook/Gemfile.lock \
     event-webhook/icalia-sdk-event-webhook.gemspec \
     /workspaces/icalia-sdk/event-webhook/
COPY event-webhook/lib/icalia-sdk-event-webhook/version.rb \
     /workspaces/icalia-sdk/event-webhook/lib/icalia-sdk-event-webhook/

# Copy the Event SDK meta library dependency files:
COPY event/Gemfile \
     event/Gemfile.lock \
     event/icalia-sdk-event.gemspec \
     /workspaces/icalia-sdk/event/
COPY event/lib/icalia-sdk-event/version.rb \
     /workspaces/icalia-sdk/event/lib/icalia-sdk-event/

# Copy the SDK meta library dependency files:
COPY sdk/Gemfile \
     sdk/Gemfile.lock \
     sdk/icalia-sdk.gemspec \
     /workspaces/icalia-sdk/sdk/
COPY sdk/lib/icalia-sdk/version.rb \
     /workspaces/icalia-sdk/sdk/lib/icalia-sdk/

# Step X: Install all ruby library dependencies
RUN for dir in core event-notification event-webhook event sdk; do \
  cd $dir ; \
  bundle install --jobs=4 --retry=3 ; \
  cd .. ; \
  done
