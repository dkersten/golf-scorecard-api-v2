class AddCourseNameToScorecard < ActiveRecord::Migration[6.0]
  def change
    add_column :scorecards, :course, :string
  end
end
