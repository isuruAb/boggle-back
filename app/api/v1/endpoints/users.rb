module V1
  module ENDPOINTS
    class Users < Grape::API

      format :json
      prefix :api
      resource :boggle do
      
        desc "get top 10 users"
        params do
        end
        get :users do
         @users =User.order("points DESC").limit(10)
         present :status, 201
         present :users, @users

        end

        desc "Store user after the game ends"
        params do
          requires :username, type: String, desc: "Name of the user"
          requires :points, type: Integer, desc: "Score of the user"
          requires :datetime, type: DateTime, desc: "played time"

        end
        post :user do
          print "params['username']",params["username"]
          @user =User.create(
          username: params["username"], 
          points:params["points"], 
          datetime: params["datetime"] )
          present :status, 201
          present :user, @user

        end

      end
    end
  end
end