class Trap::Request < ActiveRecord::Base
  belongs_to :trap

  serialize :query_params,  JSON
  serialize :cookies,       JSON
  serialize :headers,       JSON
  serialize :response,      JSON

  scope :desc_by_created, -> { order(created_at: :desc) }
  scope :last_created,    -> { desc_by_created.limit(1) }
end
