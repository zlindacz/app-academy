class AssociationBtwUrlTagging < ActiveRecord::Migration
  def change
    add_column :taggings, :shortened_url_id, :integer
  end
end
