class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id' do
    binding.pry
    @recipe = Recipe.find_by(params[:id])
    binding.pry
    erb :show
  end

  post '/recipes' do
    binding.pry
    @recipe = Recipe.create(params)
    redirect '/recipes'
  end


end
