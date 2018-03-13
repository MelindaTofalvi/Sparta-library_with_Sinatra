require 'sinatra'
require 'pg'
require 'sinatra/reloader' if development?
require_relative './models/book.rb'
require_relative './controllers/books_controller.rb'

use Rack::Reloader
use Rack::MethodOverride


run BooksController