feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end

  scenario 'visiting the bookmarks page' do
    visit('/bookmarks')
    expect(page).to have_content "Look at all these bookmarks"
  end
end
