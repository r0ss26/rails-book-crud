class BooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :setup_data

  def index
    render json: @data
  end

  # Create
  def create
    id = (@data.length + 1).to_s
    @data.push({
      "id": id,
      "title": params[:title],
      "author": params[:author]
    })
    render json: @data
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
    @data.delete(book)
    render json: @data
  end

  def get_book(id)
    @data.each do |book|
      return book if book[:id] == id
    end
    return {}
  end

  def get_book_index(id)
    @data.each_with_index do |book, i|
      return i if book[:id] == id
    end
    return -1
  end

  private
    def setup_data
        @data = [
            { id: "1", title: "Harry Potter", author: "J.K Rowling" },
            { id: "2", title: "Name of the wind", author: "Patrick Rothfuss" }
        ]
    end
end