require 'bookmark'

describe Bookmark do
  it 'can return all entries' do
    expect(Bookmark).to respond_to(:all)
  end

  describe '.all' do
    # it 'returns a list of bookmarks' do
    #   connection = PG.connect(dbname: 'bookmark_manager_test')
    #
    #   # Add the test data
    #   connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    #   connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    #   connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
    #
    #   bookmarks = Bookmark.all
    #
    #   expect(bookmarks).to include('http://www.makersacademy.com')
    #   expect(bookmarks).to include('http://www.destroyallsoftware.com')
    #   expect(bookmarks).to include('http://www.google.com')
    # end

    it 'returns a list of bookmarks' do
     connection = PG.connect(dbname: 'bookmark_manager_test')

     # Add the test data
     bookmark = Bookmark.add(url: "http://www.makersacademy.com", title: "Makers Academy")
     Bookmark.add(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
     Bookmark.add(url: "http://www.google.com", title: "Google")

     bookmarks = Bookmark.all

     expect(bookmarks.length).to eq 3
     expect(bookmarks.first).to be_a Bookmark
     expect(bookmarks.first.id).to eq bookmark.first['id']
     expect(bookmarks.first.title).to eq 'Makers Academy'
     expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end



  end

  describe '.create' do
    # whats wrong with this?
    # it 'creates a new bookmark' do
    #   Bookmark.add(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
    #
    #   expect(Bookmark.all).to include 'http://www.testbookmark.com' && 'Test Bookmark'
    # end

    xit 'creates a new bookmark' do
      bookmark = Bookmark.add(url: 'http://www.testbookmark.com', title: 'Test Bookmark').first

      expect(bookmark['url']).to eq 'http://www.testbookmark.com'
      expect(bookmark['title']).to eq 'Test Bookmark'
    end


    it 'creates a new bookmark' do
      bookmark = Bookmark.add(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
    end
  end

end
