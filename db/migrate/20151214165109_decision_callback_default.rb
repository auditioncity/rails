class DecisionCallbackDefault < ActiveRecord::Migration
  def change
    change_column_default :decisions, :callback, false
  end
end
