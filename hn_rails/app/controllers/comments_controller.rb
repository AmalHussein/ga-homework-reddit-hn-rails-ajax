class CommentsController < ActionController::Base 
	before_action :set_comment, only: [:show, :edit, :update, :destroy]

	def index
		if params[:post_id]
			@comments = Comment.where(:post_id, params[:post_id])
		else  
      @comments = Comment.all #add in a sort by statement here
    end 
  end
 
  def show
  end

  def new
  	@comment = Comment.new
  end


  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to category_post_path(@post.category_id, @post), notice: 'Comment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comment }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  # def create
  # 	@comment = Comment.new(comment_params)
  # 	 respond_to do |format|
  #     if @comment.save
  #       format.html { redirect_to @comment, notice: 'comment was successfully created.' }
  #       format.json { render action: 'show', status: :created, location: @comment }
  #       format.js 
  #     else
  #       format.html { render action: 'new' }
  #       format.json { render json: @comment.errors, status: :unprocessable_entity }
  #       format.js
  #      end 
  #     end 
  # end

  def edit
  end

  def update
  	@comment.update(comment_params)
  	if @comment.save 
  		redirect_to @comment
  	else 
  		render action: 'edit'
  	end 
  end

  def destroy
  	@comment.destroy
  	redirect_to comments_url 
  end

  private 

  def set_comment
  	@comment = Comment.find(params[:id])
  end 

  def comment_params
    params.require(:comment).permit(:title, :body, :post_id, :user_id)
  end 

end
