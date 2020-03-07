# frozen_string_literal: true

module Icalia
  class EmailAccount < ModelBase
    attr_reader :address,
                :created_at
    
    has_one :owner
  end
end
