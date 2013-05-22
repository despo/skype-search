require 'skype_search'
require 'highline/import'
module SkypeSearch
  class Cli

    def initialize
      @skype_search = SkypeSearch.configure
      set_color_scheme
    end

    def options
      [ "Select conversation",
        "Select group conversation",
        "Search for text",
        "Exit" ]
    end

    def prompt
      choose do |menu|
        menu.header = "What do you want to do"

        menu.choices *options
      end
    end

    def process selection
      send selection.downcase.split(" ").join("_")
    end

    private

    def select_conversation
      print "Conversation", @skype_search.find_messages_between(select_contact).map(&:to_s)
    end

    def select_group_conversation
      print "Group conversation", @skype_search.find_conversation_by_id(select_group).map(&:to_s)
    end

    def search_for_text
      search_string = ask("What are you looking for?") do |question|
        question.case = :up
        question.validate = -> (q)  { q.length >= 3 }
        question.responses[:not_valid] = "You search needs to be at least 3 characters long"
      end
      print "Search results", @skype_search.search_for(search_string).map(&:to_s)
    end

    def exit
      abort "Game over!"
    end

    def select_contact
      choose do |menu|
        menu.prompt = "Select a contact"

        menu.choices *@skype_search.find_contacts.map(&:dialog_partner)
      end
    end

    def select_group
      group_conversations = @skype_search.find_conversations
      selection = choose do |menu|
        menu.prompt = "Select a contact"

        menu.choices *group_conversations.map(&:to_s)
      end
      group_conversations.select { |con| con.to_s == selection }.first.id
    end

    def set_color_scheme
      colors = HighLine::ColorScheme.new do |cs|
        cs[:headline] = [ :bold, :yellow, :on_black ]
        cs[:horizontal_line] = [ :bold, :white, :on_blue]
        cs[:even_row] = [ :yellow ]
        cs[:odd_row] = [ :gray ]
      end
      HighLine.color_scheme = colors
    end

    def print title=nil, messages
      print_title title if title
      messages.each_with_index do |message, index|
        OutputProcessor.new(message).parse

        say(%{<%= color('#{message}', '#{get_row_color(index)}') %>})
      end
    end

    def print_title title
      say("<%= color('#{title}', :headline) %>")
      say("<%= color('*'*30, :horizontal_line) %>")
    end

    def get_row_color index
      index.odd? ? :odd_row : :even_row
    end

  end
end
