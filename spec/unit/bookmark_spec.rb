require 'bookmark'
require_relative '../setup_test_database'

describe Bookmark do
  describe '#all' do
    it "converts database data to ruby objects" do
      add_fresh_bookmarks
      expect(Bookmark.all).to include(be_an_instance_of(Bookmark))
    end

    it "ruby objects have id, url and title attributes" do
      add_fresh_bookmarks
      expect(Bookmark.all.first).to respond_to(:id)
      expect(Bookmark.all.first).to respond_to(:url)
      expect(Bookmark.all.first).to respond_to(:title)
    end
  end

  describe '#add' do
    it "takes an input and adds in to the bookmark table" do
      Bookmark.add("http://www.dogpix.com", "Dog Pix")
      expect(Bookmark.all.map { |bookmark| bookmark.title }).to include "Dog Pix"
      expect(Bookmark.all.map { |bookmark| bookmark.url }).to include "http://www.dogpix.com"
    end
  end

  describe '#delete' do
    it "removes a bookmark from the table" do
      Bookmark.add("http://www.dogpix.com", "Dog Pix")
      Bookmark.delete(id: Bookmark.all.first.id)

      expect(Bookmark.all.length).to eq 0
    end
  end
end
