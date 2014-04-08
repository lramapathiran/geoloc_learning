class CreateVoluntaries < ActiveRecord::Migration
  def change
    create_table :voluntaries do |t|

      t.timestamps
    end
  end
end
