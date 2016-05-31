class AddTransportationToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :transportation, :string
  end
end
