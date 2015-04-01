class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all

    respond_to do |format|
      format.html {
        @books_json = @books.map{ |b| BookSerializer.new(b).serializable_hash }
        @urls = {
          books: books_path
        }
      }
      format.json { render json: @books }
    end
  end

  def show
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.create(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render json: @book }
      else
        format.html { render action: 'new' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render json: @book}
      else
        format.html { render action: 'edit' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @book.destroy
    respond_to do |format|
      format.html {
        redirect_to books_url, notice: 'Book was deleted'
      }
      format.json { render json: { message: "#{@book.title} was deleted" } }
    end
  end

  private

    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :author)
    end
end
