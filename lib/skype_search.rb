require 'skype_search/settings'
require 'skype_search/db'
require 'skype_search/db/base'
require 'skype_search/db/messages'
require 'skype_search/db/conversations'
require 'skype_search/output_processor'

module SkypeSearch

  def self.configure
    SkypeSearch::DB.new(Settings.new.user_db)
  end
end
