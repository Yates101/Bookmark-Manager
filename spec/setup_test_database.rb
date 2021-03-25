require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'bookmark_manager_test')

  connection.exec("TRUNCATE bookmarks;")
end

def add_fresh_bookmarks
  connection = PG.connect(dbname: 'bookmark_manager_test')

  connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.google.com', 'Google');")
  connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.twitter.com', 'Twitter');")
  connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.linkedin.com', 'Linkedin');")
end
