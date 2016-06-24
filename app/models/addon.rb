class Addon
  #addons is a type that changes product original price.
  include Mongoid::Document
  include Mongoid::Timestamps

  MONEY = "money"
  PERCENTAGE = "percentage"

  ALL = [PERCENTAGE, MONEY]

  validates :type, inclusion: { in: Addon::ALL }

  #{"id": 3, "value": 20, type: "percentage"}
  field :name, type: String
  field :value, type: Integer
  field :type, type: String
  field :description, type: String

  def for_product_params
    { id: id, type: type, value: value }
  end
end