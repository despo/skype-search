require 'skype_search'
require 'highline/import'
module SkypeSearch
  class Cli
    def initialize
      @skype_search = SkypeSearch.configure
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
      puts @skype_search.find_messages_between(select_contact).map(&:to_s)
    end

    def select_group_conversation
      puts @skype_search.find_conversation_by_id(select_group).map(&:to_s)
    end

    def search_for_text
      search_string = ask("What are you looking for?") do |question|
        question.case = :up
        question.validate = -> (q)  { q.length >= 3 }
        question.responses[:not_valid] = "You search needs to be at least 3 characters long"
      end
      puts @skype_search.search_for search_string
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

  end
end
