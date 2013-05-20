require 'sqlite3'
module FindInSkype
  class DB
    def initialize database
      @database = SQLite3::Database.new(database)
    end

    def find_contacts
      @database.execute("SELECT DISTINCT(dialog_partner) FROM Messages")
    end

    def find_messages_between user
      @database.execute("SELECT author, from_dispname, datetime(timestamp, 'unixepoch') as date, body_xml FROM Messages where dialog_partner = '#{user}' ORDER BY timestamp")
    end
  end
end
