#GETS========================================================================

get '/post/new' do
  @post = Post.new
  erb :"post/new"
end

get '/post/:id/edit' do
  id = params[:id]
  @post = Post.find(id)
  erb :edit
end

get '/post/:id/destroy' do
	id = params[:id]
	post = Post.find(id)
	post.destroy
	redirect ('/')
end

post '/post/:id' do
	@post = Post.find(params[:id])
	title = params[:post][:title]
	body = params[:post][:body]

	@post.update_attributes(:title => title, :body => body)
	@post.create_tags(params[:post][:tags])

	redirect "/post/#{params[:id]}"
end

get '/post/:id' do
  id = params[:id]
  @post = Post.find(id)
  erb :post
end

#POST========================================================================
post '/post' do
	title = params[:post][:title]
	body = params[:post][:body]
	@post = Post.create(:title => title, :body => body)
	@post.create_tags(params[:post][:tags])
	id = @post.id

	redirect "/post/#{id}"
end


