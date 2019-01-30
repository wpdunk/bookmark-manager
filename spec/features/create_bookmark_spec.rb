feature 'Adding bookmarks' do
  # scenario 'a user can add a bookmark' do
  #   visit('/bookmarks')
  #   fill_in 'url', with: 'https://github.com/'
  #   click_button 'Submit'
  #   expect(page).to have_content 'https://github.com/'
  # end
  scenario 'A user can add a bookmark to Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://testbookmark.com')
    fill_in('title', with: 'Test Bookmark')
    click_button('Submit')
    # expect(page).to have_content 'http://testbookmark.com'
    expect(page).to have_link('Test Bookmark', href: 'http://testbookmark.com')

  end
end
