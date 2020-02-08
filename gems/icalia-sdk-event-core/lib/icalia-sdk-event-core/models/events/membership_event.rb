# frozen_string_literal: true

module Icalia
  class MembershipEvent < ModelBase
    include ResourceAction
    has_one :membership

    def added?; action == 'added'; end
    def removed?; action == 'removed'; end
  end
end
