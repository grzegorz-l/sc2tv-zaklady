class Duel < ActiveRecord::Base
  has_many :bets, :dependent => :destroy
 
  
  protected
  def finish_bet
    @bets = self.bets
    if self.finished == true
      @bets.each {|bet| if bet.winner == self.winner then 
        @user = User.find_by_id(bet.user_id)
        @user.gold += 2*bet.gold
        @user.save
      end 
      bet.destroy}
    end
  end
end
