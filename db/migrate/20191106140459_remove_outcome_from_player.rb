class RemoveOutcomeFromPlayer < ActiveRecord::Migration[5.2]
  def change
    remove_column :players, :outcome, :boolean
  end
end
