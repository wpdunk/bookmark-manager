feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end

  scenario 'visiting the bookmarks page' do
    visit('/bookmarks')
    expect(page).to have_content "Look at all these bookmarks"
  end

  scenario 'A user can see bookmarks' do

    # Add the test data
    Bookmark.add(url: "http://www.makersacademy.com")
    Bookmark.add(url: "http://www.destroyallsoftware.com")
    Bookmark.add(url: "http://www.google.com")


    visit('/bookmarks')

    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end

end
