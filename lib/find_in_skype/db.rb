require 'sqlite3'
module FindInSkype
  class DB
    def initialize database
      @database = SQLite3::Database.new(database)
    end

    def find_contacts
      @database.execute("SELECT DISTINCT(dialog_partner) FROM Messages")
    end
  end
end
