require 'rspec'
require_relative '../label'

RSpec.describe Label do
  describe '#add_item' do
    let(:label) { Label.new('Test Label', 'blue') }
    let(:item) { double('Item') }

    it 'assigns the label to the item' do
      expect(item).to receive(:label=).with(label)
      label.add_item(item)
    end
  end
end