require 'skype_search/settings'
require 'skype_search/db'
require 'skype_search/db/base'
require 'skype_search/db/messages'
require 'skype_search/db/conversations'

module SkypeSearch

  def self.configure
    SkypeSearch::DB.new(Settings.new.user_db)
  end

end
