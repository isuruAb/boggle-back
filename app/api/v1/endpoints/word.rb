
module V1
  module ENDPOINTS
    class Word < Grape::API

      format :json
      prefix :api
      resource :word do
      
        desc "Returns Characters of boggle board"
        params do
            #requires :token, type: String, desc: "Access token."
        end
        get :characters do   
           # random= ['VSLHERAESITSMRPS']
            {data: ['V','S','L','H','E','R','A','E','S','I','T','S','M','R','P','S']}
        end

        desc "Check correctness of words"
        params do
            requires :word, type: String, desc: "Selected word."
        end
        post :selected do   

           wordArr= ['SIT','IT','ARE','EAR'];
           check=wordArr.include?(params[:word])
            split=params[:word].split('')
            {check:check,split:split}
        end

      end
    end
  end
end