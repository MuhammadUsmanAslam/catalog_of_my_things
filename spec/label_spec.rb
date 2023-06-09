require 'rspec'
require_relative '../label'
require_relative '../item'

RSpec.describe Label do
  describe '#add_item' do
    let(:label) { Label.new('Label Title', 'Label Color') }
    let(:item) { Item.new(1, 'Genre', 'Author', 'Source', nil, '2022, 1, 1', false) }

    it 'assigns the label to the item' do
      label.add_item(item)
      expect(item.label).to eq(label)
    end

    it 'adds the item to the items array' do
      label.add_item(item)
      expect(label.instance_variable_get(:@items)).to include(item)
    end
  end
end