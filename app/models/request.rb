class Request < ApplicationRecord
  belongs_to :user
  has_many :matchs, dependent: :destroy

  validates :date, :time, :location, presence: true

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [:location, :date],
    using: {
      tsearch: { prefix: true }
    }
end
