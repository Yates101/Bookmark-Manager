feature 'Adding bookmarks' do
  scenario 'user adds page and sees it on bookmarks list' do
    visit '/bookmarks'
    click_button 'Add link'
    fill_in 'url', with: 'http://www.dogpix.com'
    fill_in 'title', with: 'Dog Pix'
    click_button 'Add to bookmarks'
    expect(page).to have_link("Dog Pix", :href => 'http://www.dogpix.com')
  end
end
