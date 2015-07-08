class Trap::Request < ActiveRecord::Base
  belongs_to :trap
  serialize :query_params,  JSON
  serialize :cookies,       JSON
  serialize :headers,       JSON
  serialize :response,      JSON
end
