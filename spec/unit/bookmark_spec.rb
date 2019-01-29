require 'bookmark'

describe Bookmark do
  it 'can return all entries' do
    expect(Bookmark).to respond_to(:all)
  end

  describe '.all' do
      it 'returns all bookmarks' do
        bookmarks = Bookmark.all

        expect(bookmarks).to include("http://www.makersacademy.com")
        expect(bookmarks).to include("http://www.google.com")
        expect(bookmarks).to include("http://www.destroyallsoftware.com")
      end


    end

end
