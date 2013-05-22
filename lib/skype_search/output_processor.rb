module SkypeSearch
  class OutputProcessor

    EMOTICON_MATCHER = /<ss type=\"(?<type>.{,6})\">(?<symbol>.{,6})<\/ss>/
    EMOTICON_REPLACE = /<ss type=\".{,6}\">.{,6}<\/ss>/

    attr_accessor :output

    def initialize output
      @output = output
    end

    def parse
      replace_all matches unless matches.nil?

      self
    end

    private

    def matches
      scan_for_emoticons.map { |emoticon| EMOTICON_MATCHER.match(emoticon) }
    end

    def scan_for_emoticons
      @output.scan(EMOTICON_REPLACE)
    end

    def replace_all matches
      matches.each { |match| replace(match, match[:symbol]) }
    end

    def replace match, symbol
      @output.gsub!(match.to_s, colorize(symbol))
    end

    def colorize text, color_code=31
      "\e[#{color_code}m#{text}\e[0m"
    end
  end

end
