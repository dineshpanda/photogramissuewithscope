require 'rails_helper'

RSpec.describe Photo, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:comments) }

    it { should have_many(:likes) }

    it { should belong_to(:latest_owner) }

    it { should belong_to(:owner) }

    end

    describe "InDirect Associations" do

    it { should have_many(:fans) }

    it { should have_many(:commenters) }

    end

    describe "Validations" do

    it { should validate_presence_of(:image) }

    it { should validate_presence_of(:owner_id) }

    end
end
