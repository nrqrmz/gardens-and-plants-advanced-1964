class Plant < ApplicationRecord
  belongs_to :garden
  has_many :completions, dependent: :destroy

  validates :name, :image_url, presence: true
end
