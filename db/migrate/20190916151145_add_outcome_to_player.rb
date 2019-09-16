class AddOutcomeToPlayer < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :outcome, :boolean
  end
end
