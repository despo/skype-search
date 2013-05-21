require 'rexml/document'
require 'pathname'

module SkypeSearch
  class Settings

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
