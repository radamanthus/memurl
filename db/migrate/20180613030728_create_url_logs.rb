# frozen_string_literal: true

class CreateUrlLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :url_logs do |t|
      t.integer         :url_id
      t.string          :remote_ip
      t.string          :user_agent
      t.string          :browser
      t.string          :os
      t.string          :referer
      t.timestamps
    end
  end
end
