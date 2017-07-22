#class Poem < ActiveResource::Base
#  self.site = "https://poemkun.herokuapp.com"
#end
class Poem
  Rails.logger.info "hello from her model"
  include Her::Model
end
