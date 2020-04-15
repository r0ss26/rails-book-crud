class BooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  # before_action :setup_data

  def index
    render json: session[:data]
  end

  # Create
  def create
    book = {
      "id": (session[:data].length + 1).to_s,
      "title": params[:title],
      "author": params[:author]
    }
    session[:data].push(book)
    
    render json: session[:data]
  end

  # Read
  def show
    book = get_book(params[:id])
    render json: book
  end

  # Update
  def update
    book = get_book(params[:id])
    book["title"] = params[:title]
    book["author"] = params[:author]
    render json: book
  end

  # Delete
  def destroy
    book = get_book(params[:id])
    session[:data].delete(book)
    render json: session[:data]
  end

  def get_book(id)
    session[:data].each do |book|
      return book if book[:id] == id
    end
    return {}
  end
end