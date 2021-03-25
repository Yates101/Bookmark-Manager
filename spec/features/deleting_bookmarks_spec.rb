feature 'Deleting bookmarks' do
 scenario 'user deletes a bookmark and it is removed from the database' do
  Bookmark.add('http://www.makersacademy.com', 'Makers Academy')
  visit '/bookmarks'
  first('.bookmark').click_button 'Delete'

  expect(current_path).to eq '/bookmarks'
  expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
 end
end
