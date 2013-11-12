class CreateTalents < ActiveRecord::Migration
  def change
    create_table :talents do |t|
      t.string :name
    end
  end
end
