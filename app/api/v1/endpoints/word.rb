
module V1
  module ENDPOINTS
    class Word < Grape::API

      format :json
      prefix :api
      resource :word do
      
        desc "Returns pong if logged in correctly"
        params do
            #requires :token, type: String, desc: "Access token."
        end
        get :ping do   
            puts 'done'
        end
      end
    end
  end
end