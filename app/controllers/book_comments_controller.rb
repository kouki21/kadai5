class BookCommentsController < ApplicationController

  def create
    @book_comment = BookComment.new
    @book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = @book.id
    #上の記述はコメントはどの本に対してコメントしたのかを一致させる
    comment.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
