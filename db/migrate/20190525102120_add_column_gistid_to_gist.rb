class AddColumnGistidToGist < ActiveRecord::Migration[5.2]
  def change
    add_column :gists, :gistid, :string
  end
end
