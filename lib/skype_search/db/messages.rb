module SkypeSearch
  class Messages < ActiveRecord::Base
    self.inheritance_column = 'class_type'

    def to_s
      "[#{self.created_at}] #{self.from_dispname} > #{self.body_xml}"
    end

    def created_at
      fmt = "%d/%m/%Y %I:%M:%S %p"
      Time.at(self.timestamp).to_datetime.strftime(fmt)
    end
  end
end
