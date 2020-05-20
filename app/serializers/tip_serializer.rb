class TipSerializer < ActiveModel::Serializer
  attributes :id, :tip_percent, :tip_amount, :total, :fees, :grand_total, :service_rating, :exp_rating
  has_one :user
end
