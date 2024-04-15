require 'jsonapi/serializer'
class UserSerializer
  include JSONAPI::Serializer
  attributes :id ,:email
end
