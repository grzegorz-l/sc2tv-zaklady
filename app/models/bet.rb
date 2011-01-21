class Bet < ActiveRecord::Base
belongs_to :duel
belongs_to :user
before_destroy :refund_gold
validate :duel_start_date_can_not_be_in_the_past
validates_numericality_of :gold, :only_integer => true

protected
 def refund_gold
   @duel = Duel.find_by_id(self.duel_id)
   if @duel.date > Time.now then
   @user = User.find_by_id(self.user_id)
   @user.gold += self.gold
   @user.save
   end
 end
 
 def duel_start_date_can_not_be_in_the_past
    errors.add :duel if duel.date < Time.now.utc
  end
 
end
