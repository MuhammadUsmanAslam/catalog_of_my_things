require_relative 'genre'

describe Genre do
  before :each do
    @genre = Genre.new('comedy')
  end

  it 'Test for Genre instance' do
    expect(@genre).to be_instance_of Genre
  end

  it 'Test for attribute' do
    expect(@genre).to have_attributes(name: 'comedy')
  end

  it 'Test for add_item method' do
    item = double('Item')
    allow(item).to receive(:publish_date) { '2020-02-02' }
    allow(item).to receive(:genre=)
    @genre.add_item(item)
    expect(@genre.items[0].publish_date).to eq('2020-02-02')
  end
end
