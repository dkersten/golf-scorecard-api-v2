class AddShotBreakdownToScorecards < ActiveRecord::Migration[6.0]
  def change
    add_column :scorecards, :holes, :integer, :default => 0
    add_column :scorecards, :eagles, :integer, :default => 0
    add_column :scorecards, :birdies, :integer, :default => 0
    add_column :scorecards, :pars, :integer, :default => 0
    add_column :scorecards, :bogeys, :integer, :default => 0
    add_column :scorecards, :other_scores, :integer, :default => 0
  end
end
