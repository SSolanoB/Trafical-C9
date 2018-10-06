class AddTrackDigestToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :track_digest, :string
  end
end
