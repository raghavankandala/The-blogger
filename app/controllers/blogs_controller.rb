class BlogsController < ApplicationController

	def index
		@blogs = Blog.all
	end

	def new
		@blog = Blog.new
	end

	def create
		#1. create an instance of the Blog
      #2. Set the values of the attributes of the blog from the data sent to the server from /blogs/new form
		#3. Request parameters available through the keyword params and params is a Hash
	
		blog_values = params[:blog]
		@blog = Blog.new(blog_values)
		if @blog.save
			flash[:notice] = "Hurray! Your blog with title #{@blog.title} is created"
			redirect_to blogs_path #, :notice => "Hurray! Your blog with title #{@blog.title} is created!"
		else
			render :new # render the view corresponding to the new action in this controller
		end
	end

	def edit
	end
	
	def update
	end

	def destroy
	end

end
