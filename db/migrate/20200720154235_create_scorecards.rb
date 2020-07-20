class CreateScorecards < ActiveRecord::Migration[6.0]
  def change
    create_table :scorecards do |t|
      t.integer :user_id
      t.json :f9_par
      t.json :f9_score
      t.json :b9_par
      t.json :b9_score
      t.timestamps
    end
  end
end
