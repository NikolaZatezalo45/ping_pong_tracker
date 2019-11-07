class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.references :player_1, foreign_key: {to_table: :players}
      t.references :player_2, foreign_key: {to_table: :players}
      t.integer :player_1_score
      t.integer :player_2_score
      t.references :winner, foreign_key: {to_table: :players}
      t.timestamps
    end
  end
end
