# frozen_string_literal: true

module Icalia
  class Membership < ModelBase
    attr_reader :created_at
                
    has_one :member, :group
  end
end
