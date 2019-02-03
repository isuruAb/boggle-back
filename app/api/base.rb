require 'grape-swagger'

class Base < Grape::API
    format :json
    version 'v1', using: :path
    mount V1::ENDPOINTS::Word
    
    add_swagger_documentation

end