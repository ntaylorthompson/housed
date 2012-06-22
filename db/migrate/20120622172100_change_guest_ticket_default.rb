class ChangeGuestTicketDefault < ActiveRecord::Migration
  def change
    change_column_default(:guests, :tickets, 0)
  end

end
