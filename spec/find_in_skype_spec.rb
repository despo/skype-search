require 'spec_helper'

describe FindInSkype do

  let(:db) { FindInSkype.configure }

  it "Retrieve all conversation users" do
    db.find_contacts.should_not be_empty
  end
end
