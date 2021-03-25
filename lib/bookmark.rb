class Bookmark

  attr_reader :id, :url, :title

  require 'pg'

  def self.connex
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'bookmark_manager_test')
    else
      PG.connect(dbname: 'bookmark_manager')
    end
  end

  def self.instance
    @bookmark
  end

  def self.all
    bookmark_list = []
    result = connex.exec("SELECT * FROM bookmarks")
    result.each do |row|
      bookmark_list << Bookmark.new(row['id'], row['url'], row['title'])
    end
    bookmark_list
  end

  def self.add(url, title)
    connex.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}')")
  end

  def self.delete(id:)
    connex.exec("DELETE FROM bookmarks WHERE id = #{id}")
  end

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end
end
