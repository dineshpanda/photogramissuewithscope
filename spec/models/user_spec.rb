require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:latest_photos) }

    it { should have_many(:accepted_sent_friend_requests) }

    it { should have_many(:received_friend_requests) }

    it { should have_many(:sent_friend_requests) }

    it { should have_many(:comments) }

    it { should have_many(:likes) }

    it { should have_many(:photos) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_numericality_of(:age).is_equal_to(20).is_less_than(22).to be != 19.is_greater_than(18).is_less_than(21).is_greater_than_or_equal_to(20).odd }

    it { should validate_uniqueness_of(:username).scoped_to(:first_name).scoped_to(:last_name).scoped_to(:age).allow_nil.case_insensitive.with_message('username should be unique always') }

    it { should validate_presence_of(:username).with_message('username can not be blank!') }

    it { should validate_length_of(:username).is_at_least(5).is_at_most(20).allow_nil }

    it { should validate_inclusion_of(:username).in_array([ "Ram", "Lakshmana" ]) }

    end
end
