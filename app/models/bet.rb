class Bet < ActiveRecord::Base
belongs_to :duel
belongs_to :user
before_destroy :refund_gold
validate :duel_can_not_be_started
validates_numericality_of :gold, :only_integer => true

protected
 # zwaramy pieniądze użytkownikowi jesli pojedynek się jeszcze nie rozpoczął
 def refund_gold
   @duel = Duel.find_by_id(self.duel_id)
   if @duel.date > Time.now then
    @user = User.find_by_id(self.user_id)
    @user.gold += self.gold
    @user.save
   end
 end
  # czas i data rozpoczęcia pojedynku musi być późniejsza niż aktualna
 def duel_can_not_be_started
    errors.add :duel if duel.date < Time.now.utc
 end
 
end
