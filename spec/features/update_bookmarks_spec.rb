feature 'Update bookmarks' do
  scenario 'User can edit and save changes to bookmarks' do
    Bookmark.add("http://www.google.com", "Google")

    visit('/bookmarks')
    first('.bookmark').click_button 'Update'

    fill_in 'url', with: 'http://www.dogpix.com'
    fill_in 'title', with: 'Dog Pix'
    click_button('Update')

    expect(current_path).to eq '/bookmarks'
    expect(page).to have_link('Dog Pix', href: 'http://www.dogpix.com')
  end
end
