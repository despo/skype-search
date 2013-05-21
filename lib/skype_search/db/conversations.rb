module SkypeSearch
  class Conversations < ActiveRecord::Base
    include Base

    def to_s
      "#{self.displayname} - created: #{self.created_at}"
    end

    def created_at
      Time.at(self.creation_timestamp).to_datetime.strftime(TIME_FORMATTER)
    end
  end
end
