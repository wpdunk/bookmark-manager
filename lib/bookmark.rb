require 'pg'

class Bookmark

def self.all
    db_connection = PG.connect( dbname: 'bookmark_manager' )
    result = db_connection.exec('SELECT * FROM bookmarks')
    result.map { |bookmark| bookmark['url'] }
  end
end
