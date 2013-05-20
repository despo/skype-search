require 'spec_helper'

describe FindInSkype do

  let(:db) { FindInSkype.configure }

  it "retrieve all users that I had conversations with" do
    db.find_contacts.should_not be_empty
    db.find_contacts.should be_an Array
  end
end
