class Api::DreamsController < ApplicationController

 #  welcome_index GET    /welcome/index(.:format)       welcome#index
 #           root GET    /                              welcome#index
 #     api_dreams GET    /api/dreams(.:format)          api/dreams#index

skip_before_action :verify_authenticity_token
 def index
   render json: {dreams: Dream.all }
 end

 #                POST   /api/dreams(.:format)          api/dreams#create
 def create
   new_dream = Dream.create dream_params
   render json: {dreams: new_dream }
 end

 #  new_api_dream GET    /api/dreams/new(.:format)      api/dreams#new

 # edit_api_dream GET    /api/dreams/:id/edit(.:format) api/dreams#edit

 #      api_dream GET    /api/dreams/:id(.:format)      api/dreams#show
 def show
   my_dream = Dream.find params[:id]
   render json: {dream: my_dream}
 end

 #                PATCH  /api/dreams/:id(.:format)      api/dreams#update
 #                PUT    /api/dreams/:id(.:format)      api/dreams#update

 def update
   dream = Dream.find params[:id]
   dream.update dream_params
   render json: {dream: dream}
 end

 #                DELETE /api/dreams/:id(.:format)      api/dreams#destroy
 def destroy
   bye_dream = Dream.find params[:id]
   bye_dream.destroy
   render json: {dreams: Dream.all }
  # render json: {success: "goodbye dream: " + bye_dream.topic}
  end

  private

  def dream_params
    params.require(:dream).permit(:topic, :description, :code, :creator)
  end

end
