class Match < ApplicationRecord
  belongs_to :player_1, class_name: 'Player', :foreign_key => 'player_1_id'
  belongs_to :player_2, class_name: 'Player', :foreign_key => 'player_2_id'
  belongs_to :winner, class_name: 'Player', :foreign_key => 'winner_id'
  validates :player_1, :player_2, :player_1_score, :player_2_score, presence: true
  validates_numericality_of :player_1_score, :player_2_score, :only_integer => true, :greater_than_or_equal_to => 0
  validate :check_players

  def check_players
    errors.add(:player, "You can't play yourself") if player_1 == player_2
  end
end
