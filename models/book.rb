class Book
	attr_accessor :id, :title, :body

	def self.open_connection
		conn = PG.connect(dbname: "library")
	end

	def self.all
		conn = self.open_connection
		sql = "SELECT id, title, body FROM book ORDER BY id"
		result = conn.exec(sql)
		books = result.map do |tuple|
			self.hydrate tuple
		end
		books
	end

	def self.hydrate book_data
		book = Book.new
		book.id = book_data['id']
		book.title = book_data['title']
		book.body = book_data['body']
		book
	end

	def self.grab id
		conn = self.open_connection
		sql = "SELECT id, title, body FROM book WHERE id=#{id}"
		result = conn.exec(sql)
		books = result.map do |tuple|
			self.hydrate tuple
		end
		books[0]
	end

	def save
		conn = Book.open_connection
		sql = "INSERT INTO book (title,body) VALUES ('#{self.title}','#{self.body}')"
		result = conn.exec(sql)
	end	

	def self.update id, title, body
		conn = Book.open_connection
		sql = "UPDATE book SET title = '#{title}', body = '#{body}' WHERE id=#{id}"
		result = conn.exec(sql)
	end

	def self.delete id
		conn = self.open_connection
		sql = "DELETE FROM book WHERE id=#{id}"
		conn.exec(sql)
	end
end