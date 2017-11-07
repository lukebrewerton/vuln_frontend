class Bulletin
  include Mongoid::Document
  field :id, type: String
  field :description, type: String
  field :source, type: String
end
