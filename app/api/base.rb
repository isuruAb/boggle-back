require 'grape-swagger'

class Base < Grape::API
    format :json
    version 'v1', using: :path
    
    mount V1::ENDPOINTS::Word
    mount V1::ENDPOINTS::Users

    add_swagger_documentation

end