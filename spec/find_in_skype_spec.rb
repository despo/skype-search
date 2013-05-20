require 'spec_helper'

describe FindInSkype do

  let(:db) { FindInSkype.configure }

  it "retrieve all users that I had conversations with" do
    db.find_contacts.should_not be_empty
    db.find_contacts.should be_an Array
  end

  it 'retrieves a conversation by username' do
    db.find_conversation_with("find_in_skype").flatten.should include "find_in_skype", "hey ho"
  end
end
