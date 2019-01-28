require 'bookmark'

describe Bookmark do
  it 'can return all entries' do
    expect(subject).to respond_to(:all)
  end
end
