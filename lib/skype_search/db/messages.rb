module SkypeSearch
  class Messages < ActiveRecord::Base
    include Base

    def to_s
      "[#{self.created_at}] #{self.from_dispname} > #{self.body_xml}"
    end

    def created_at
      Time.at(self.timestamp).to_datetime.strftime(TIME_FORMATTER)
    end
  end
end
