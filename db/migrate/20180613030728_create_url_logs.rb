class CreateUrlLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :url_logs do |t|
      t.integer         :url_id
      t.string          :remote_ip
      t.string          :headers
      t.timestamps
    end
  end
end
