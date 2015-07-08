class CreateTrapRequests < ActiveRecord::Migration
  def change
    create_table :trap_requests do |t|
      t.references :trap, index: true, foreign_key: true
      t.string :remote_ip,      limit: 45
      t.string :request_method, limit: 8
      t.string :scheme,         limit: 8
      t.text :query_string
      t.text :query_params
      t.text :cookies
      t.text :headers
      t.text :response
      t.timestamps null: false
    end
  end
end
