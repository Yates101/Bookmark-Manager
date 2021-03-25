require 'pg'
require_relative '../setup_test_database'

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do 
    add_fresh_bookmarks
    visit('/bookmarks')

    expect(page).to have_content "Google"
    expect(page).to have_content "Twitter"
    expect(page).to have_content "Linkedin"
  end
end
