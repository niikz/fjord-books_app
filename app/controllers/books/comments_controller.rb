class Books::CommentsController < CommentsController
  before_action :set_commentable
  before_action :set_render

  private

  def set_commentable
    @commentable = Book.find(params[:book_id])
  end

  def set_render
    @template = 'books/show'
  end
end
