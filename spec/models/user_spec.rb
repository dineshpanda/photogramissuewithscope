require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_length_of(:username).is_at_least(5).is_at_most(20).allow_nil }

    it { should validate_inclusion_of(:username).in_array([ "Ram", "Lakshmana" ]) }

    end
end
