class Cvss
  include Mongoid::Document
  field :score, type: Integer
  field :vector, type: String
  embedded_in :vulnerability
end
