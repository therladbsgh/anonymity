class CreateMagics < ActiveRecord::Migration
  def change
    create_table :magics do |t|

      t.belongs_to :user
      t.belongs_to :submission
      t.belongs_to :assignment
      t.string :magic_word

      t.timestamps null: false
    end
  end
end
