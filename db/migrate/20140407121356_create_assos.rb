class CreateAssos < ActiveRecord::Migration
  def change
    create_table :assos do |t|

      t.timestamps
    end
  end
end
