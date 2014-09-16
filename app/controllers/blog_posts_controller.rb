class BlogPostsController < ApplicationController
	
	before_filter :load_blog_post, :only => [:show, :edit, :update, :destroy]

	def index
		@blog_posts = BlogPost.all
	end

	def new
		@blog_post = BlogPost.new
		@blogs = Blog.all
	end

	def create
		@blog_post = BlogPost.new(params[:blog_post])
		if @blog_post.save
			flash[:notice] = "Your BlogPost is saved successfully!"
			redirect_to @blog_post
		else
			@blogs = Blog.all
			render :new
		end
	end

	def show
	end

	def edit
		@blogs = Blog.all
	end

	def update
		if @blog_post.update_attributes(params[:blog_post])
			flash[:notice] = "Your BlogPost has been updated!"
			redirect_to @blog_post
		else
			@blogs = Blog.all
			render :edit
		end
	end

	def destroy
		if @blog_post.destroy
			flash[:notice] = "Your BlogPost has been deleted!"
		else
			flash[:notice] = "BlogPost detetion failed!"
		end
		redirect_to blog_posts_path
	end

	private
	
	def load_blog_post
		@blog_post = BlogPost.find(params[:id])
	end

end
