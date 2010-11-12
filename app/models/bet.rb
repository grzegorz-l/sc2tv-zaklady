class Bet < ActiveRecord::Base
belongs_to :duel
belongs_to :user

end
