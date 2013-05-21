require 'skype_search/db'
require 'skype_search/db/base'
require 'skype_search/db/messages'
require 'skype_search/db/conversations'

module SkypeSearch

  def self.configure
    SkypeSearch::DB.new(Settings.new.user_db)
  end

  class Settings
    require 'rexml/document'
    require 'pathname'

    include REXML

    def user_db
      "#{skype_path}/#{user}/main.db"
    end

    def skype_settings
      @skype_settings ||= REXML::Document.new(File.open("#{skype_path}/shared.xml", "r"))
    end

    private
    def user
      @user ||= XPath.first(skype_settings, '//Account//Default').text
    end

    def skype_path
      @skype_path ||= Pathname.new("#{ENV['HOME']}/Library/Application\ Support/Skype").to_s
    end

  end
end
