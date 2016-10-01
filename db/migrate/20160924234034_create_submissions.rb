class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|

      t.string :content
      t.string :grade
      t.references :assignment
      t.references :course
      t.references :magic
      t.timestamps null: false
    end
  end
end
