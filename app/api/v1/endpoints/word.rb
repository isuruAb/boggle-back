require 'set'

module V1
  module ENDPOINTS
    class Word < Grape::API
      alphabet=['A','B','C','D','E','F','G','H','I','J','K','L','M',
        'N','O','P','Q','R','S','T','U','V','W','X','Y','Z']
      wordsWithResult=[]
      format :json
      prefix :api
      resource :boggle do
      
        desc "Returns Characters of boggle board"
        params do
            #requires :token, type: String, desc: "Access token."
        end
        get :board do   
          wordsWithResult=[]
          present :status, 201
          present :data, ['T', 'A', 'P', '*','E', 'A', 'K', 'S','O', 'B', 'R', 'S','S', '*', 'X', 'D']
        end

        desc "Check correctness of words"
        params do
            requires :word, type: Array, desc: "Selected word."
        end
        post :word do
          #Check whether there are any Stars (*)s 
          word= params[:word].join('')
          wordReg=word.downcase.gsub(/[*]/, "[a-z]")
          regexObj=Regexp.new('\b'+wordReg+'\b')

          # Get List of words from the dictionary
          lines=[]
          File.open( "dictionary.txt" ) do |io|
            io.each {|line| line.chomp! ; lines << line}
          end


          #create a regex object dynamically
          s=lines.to_set
          checkResult=lines.select { |e| regexObj =~ e }
                      
          points=0
          hasWord=false

          # Counting points
          if(checkResult.length!=0)
            hasWord=true

            for x in 0..checkResult.length-1
              points=points+1
            end
          end
          wordsWithResult.push([word,points])

          print "wordsWithResult ",wordsWithResult
          present :status, 201
          present :check, hasWord
          present :points, points
          present :results, wordsWithResult
        end

      end
    end
  end
end