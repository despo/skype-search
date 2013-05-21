module SkypeSearch
  module OutputProcessor

    EMOTICON_MATCHER = /<ss type=\"(?<type>.*)\">(?<symbol>.*)<\/ss>/
    EMOTICON_REPLACE = /<ss type=\".*\">.*<\/ss>/

    def parse message
      result =  EMOTICON_MATCHER.match(message)
      replace message, result[:symbol]
    end

    private

    def replace message, symbol
      message.gsub(EMOTICON_REPLACE, colorize(symbol))
    end

    def colorize text, color_code=31
      "\e[#{color_code}m#{text}\e[0m"
    end
  end

end
