class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :days
  has_one_attached :image
  belongs_to:user

  validates :title, :image, presence: true
  validates :content, presence: true
  validates :status, presence: true
  validates :burden, presence: true
  validates :area, presence: true
  validates :days, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 300, less_than: 9999999 }, format: { with: /\A[0-9]+\z/ }
  validates :category, presence: true
  validates :category_id, :status_id, :burden_id, :area_id, :days_id, numericality: { other_than: 1 } 



end
