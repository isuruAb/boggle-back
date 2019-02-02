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
          #Check whether there are any Stars (*)s 
          indexesOfStar=[]
        
          params[:word].each_with_index do |char, index|
            print ', * exists ', char==='*'
            if char==='*'
              indexesOfStar.push(index)
            end
          end

          print "   ", indexesOfStar , '\n'

          word= params[:word].join('')
          lines=[]
          File.open( "dictionary.txt" ) do |io|
            io.each {|line| line.chomp! ; lines << line}
          end
          s=lines.to_set
          checkResult= s.include?params[:word].join('').downcase 
          puts 'result ',checkResult
          {check:checkResult}
        end

      end
    end
  end
end