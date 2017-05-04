class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :city
      t.string :province
      t.string :country
      t.string :birth_date
      t.string :civil
      t.string :sex
      t.string :profession

      t.timestamps
    end
  end
end
