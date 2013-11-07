class PostController < ActionController::Base 
	before_action :set_student, only: [:show, :edit, :update, :destroy]

	def index
		if params[:post_id]
			@posts = Post.where(:post_id, params[:post_id])
		else  
      @posts = Post.all #add in a sort by statement here
    end 
  end

  def show
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(student_params)
  	if @post.save 
  		redirect_to @post
  	else 
  		render action: 'new'
  	end 
  end

  def edit
  end

  def update
  	@post.update(student_params)
  	if @post.save 
  		redirect_to @post
  	else 
  		render action: 'edit'
  	end 
  end

  def destroy
  	@post.destroy
  	redirect_to posts_url 
  end

  private 

  def set_post
  	@post = post.find(params[:id])
  end 

  def post_params
    params.require(:post).permit(:title, :body, :link) #comment_id here?
  end 
  
end









end
