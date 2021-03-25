class Bookmark

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
    result = connex.exec("SELECT * FROM bookmarks")
    result.map { |bookmark| bookmark['url'] }
  end

  def self.add(url)
    connex.exec("INSERT INTO bookmarks (url) VALUES ('#{url}')")
  end
end
