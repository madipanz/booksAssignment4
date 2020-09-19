class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new({:title => 'Default'})
  end

  def create
    # Instantiate a new object using form parameters
    @book = Book.new(book_params)
    # Save the object
    if @book.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "Book created successfully."
      redirect_to(books_path)
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    # Find a new object using form parameters
    @book = Book.find(params[:id])
    # Update the object
    if @book.update_attributes(book_params)
      # If save succeeds, redirect to the show action
      flash[:notice] = "Book updated successfully."
      redirect_to(book_path(@book))
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book '#{@book.name}' destroyed successfully."
    redirect_to(books_path)
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :genre, :price, :publishedDate)
  end
end
