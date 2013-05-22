require 'active_record'

module SkypeSearch
  class DB
    def initialize database
      ActiveRecord::Base.establish_connection({
        adapter:  'sqlite3',
        database: database
      })
    end

    def find_contacts
      Messages.select("distinct(dialog_partner)")
    end

    def find_messages_between user
      Messages.where(:dialog_partner => user).order(:timestamp)
    end

    def find_conversations
      Conversations.all
    end

    def find_conversation_by_id conversation_id
      Messages.where(:convo_id => conversation_id).order(:timestamp)
    end

    def search_for string
      Messages.where('body_xml like ?', %{%#{string}%}).order(:timestamp)
    end
  end

end
