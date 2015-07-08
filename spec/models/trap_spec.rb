require 'rails_helper'

RSpec.describe Trap, type: :model do
  context 'validations' do
    it 'is check uri limits' do
      trap = build(:trap, uri: 'hello'*300)
      trap.valid?
      expect(trap.errors[:uri]).to include 'is too long (maximum is 255 characters)'
    end

    it 'is check uniq uri' do
      attrs = attributes_for(:trap, uri: 'hell-of-wheels')
      Trap.create(attrs)
      trap  = Trap.new(attrs)
      trap.valid?
      expect(trap.errors[:uri]).to include 'has already been taken'
    end
  end
end
