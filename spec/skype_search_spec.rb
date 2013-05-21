require 'spec_helper'

describe SkypeSearch do

  subject(:db) { SkypeSearch::DB.new("#{Dir.pwd}/spec/data/test.db") }

  it "retrieve all users that I exchanged messages with" do
    db.find_contacts.should have(1).items
  end

  it 'retrieves all messages of a discussion' do
    db.find_messages_between("find_in_skype").last.body_xml.should include "hey ho"
  end

  it 'retrieves all conversation details' do
    conversations = db.find_conversations
    conversations.should have(1).items
  end

  it 'retrieves a conversation' do
    conversation_details = db.find_conversations.last

    conversation = db.find_conversation_by_id conversation_details
    conversation.first.convo_id.should eq conversation_details.id
  end

  it 'searches all conversations for a given text' do
    conversations = db.search_for "Resistance is futile"

    conversations.length.should == 2
  end
end
