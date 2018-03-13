class BooksController < Sinatra::Base

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')
  
  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") } 

  configure :development do
      register Sinatra::Reloader
  end

  get '/' do
      @title = "Library"
      @books = Book.all
      erb :'books/index'
  end
    
  post '/' do
    book = Book.new
    book.title = params[:title]
    book.body = params[:body]
    book.save
    redirect '/'
  end
     
  get '/new'  do
    @book = Book.new
    @book.id = ""
    @book.title = ""
    @book.body = ""
    erb :'books/new'
  end

  get '/:id' do
    id = params[:id].to_i
    @book = Book.grab id
    erb :'books/show'
  end

  put '/:id'  do
    id = params[:id].to_i
    @book = Book.update(id, params[:title], params[:body]) 
    redirect '/'
  end
    
  delete '/:id'  do
    id = params[:id].to_i
    Book.delete id
    redirect '/'
  end
    
  get '/:id/edit'  do
    id = params[:id].to_i
    @book = Book.grab id
    erb :'books/edit'
  end

end