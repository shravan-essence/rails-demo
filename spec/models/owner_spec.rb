require 'rails_helper'

RSpec.describe Owner, type: :model do
  context 'validations' do
    it "ensures the presence of name" do
      owner = Owner.new(name: "").save
      expect(owner).to eq(false)
    end
  end
end
