class Bet < ActiveRecord::Base
belongs_to :duel
belongs_to :user
<<<<<<< HEAD
before_destroy :refund_gold
validate :duel_start_date_cannot_be_in_the_past

protected
 def refund_gold
=======
before_destroy :back_gold
validate :duel_start_date_cannot_be_in_the_past

protected
 def back_gold
>>>>>>> f1ed896c65919abd0878f6063e33466881653861
   @duel = Duel.find_by_id(self.duel_id)
   if @duel.finished == false then
   @user = User.find_by_id(self.user_id)
   @user.gold += self.gold
   @user.save
   end
 end
 
 def duel_start_date_cannot_be_in_the_past
    errors.add :duel if duel.date < Time.now.utc
  end
 
end
