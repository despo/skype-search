require 'date'
module SkypeSearch
  class Conversations < ActiveRecord::Base
    self.inheritance_column = 'class_type'

    def to_s
      "#{self.displayname} - created: #{self.created_at}"
    end

    def created_at
      fmt = "%d/%m/%Y %I:%M:%S %p"
      Time.at(self.creation_timestamp).to_datetime.strftime(fmt)
    end
  end
end
