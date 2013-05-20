require 'spec_helper'

describe FindInSkype do

  let(:db) { FindInSkype.configure }

  it "retrieve all users that I exchanged messages with" do
    db.find_contacts.should_not be_empty
    db.find_contacts.should be_an Array
  end

  it 'retrieves all messages of a discussion' do
    db.find_messages_between("find_in_skype").flatten.should include "find_in_skype", "hey ho"
  end
end
