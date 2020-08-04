require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_inclusion_of(:username).in_array([ "Ram", "Lakshmana" ]) }

    end
end
