class PostsController < ActionController::Base 
	before_action :set_post, only: [:show, :edit, :update, :destroy]

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
  	@post = Post.new(post_params)
  	 respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
        format.js 
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
        format.js
       end 
      end 
  end

  def edit
  end

  def update
  	@post.update(post_params)
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
  	@post = Post.find(params[:id])
  end 

  def post_params
    params.require(:post).permit(:title, :body, :link) #comment_id here?
  end 

end

