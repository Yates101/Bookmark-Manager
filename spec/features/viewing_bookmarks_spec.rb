require 'pg'
require_relative '../setup_test_database'

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do 
    add_fresh_bookmarks
    visit('/bookmark')

    expect(page).to have_content "http://www.google.com"
    expect(page).to have_content "http://www.twitter.com"
    expect(page).to have_content "http://www.linkedin.com"
  end
end
