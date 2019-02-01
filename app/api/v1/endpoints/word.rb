require 'set'

module V1
  module ENDPOINTS
    class Word < Grape::API

      format :json
      prefix :api
      resource :boggle do
      
        desc "Returns Characters of boggle board"
        params do
            #requires :token, type: String, desc: "Access token."
        end
        get :board do   
            {data: ['T', 'A', 'P', '*','E', 'A', 'K', 'S','O', 'B', 'R', 'S','S', '*', 'X', 'D']}
        end

        desc "Check correctness of words"
        params do
            requires :word, type: Array, desc: "Selected word."
        end
        post :word do   

          word= params[:word].join('')
          lines=[]          
          File.open( "dictionary.txt" ) do |io|
            io.each {|line| line.chomp! ; lines << line if line.include? 'sob'}
          end
          s=lines.to_set
          checkResult= s.include?params[:word].join('').downcase 
          puts checkResult
          {check:checkResult}
        end

      end
    end
  end
end