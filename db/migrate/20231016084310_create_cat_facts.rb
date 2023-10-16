class CreateCatFacts < ActiveRecord::Migration[7.0]
  def change
    create_table :cat_facts do |t|
      t.text :fact

      t.timestamps
    end
  end
end
