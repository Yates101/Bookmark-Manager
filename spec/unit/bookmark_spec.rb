require 'bookmark'
require_relative '../setup_test_database'

describe Bookmark do
  describe '#all' do
    it "returns all url's from bookmark table" do
      add_fresh_bookmarks
      expect(Bookmark.all).to include("http://www.google.com", "http://www.twitter.com", "http://www.linkedin.com")
    end 
  end

  describe '#add' do
    it "takes an input and adds in to the bookmark table" do
      Bookmark.add("http://www.dogpix.com")
      expect(Bookmark.all).to include "http://www.dogpix.com"
    end
  end
end
