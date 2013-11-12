class CreateAmoebaActs < ActiveRecord::Migration
  def change
    create_table :amoeba_acts do |t|
      t.references :amoeba, index: true
      t.references :act, index: true
    end
  end
end
