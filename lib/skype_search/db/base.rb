module SkypeSearch
  module Base

    def self.included base
      base.class_eval do
        self.inheritance_column = 'class_type'
      end
    end

    TIME_FORMATTER = "%d/%m/%Y %I:%M:%S %p"
  end
end
