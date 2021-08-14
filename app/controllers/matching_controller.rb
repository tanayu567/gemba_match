class MatchingController < ApplicationController
  before_action :authenticate_user!

  def index
    got_reaction_user_ids = Relationship.where(followed_id: current_user.id).pluck(:follower_id)
    @match_users = Relationship.where(followed_id: got_reaction_user_ids, follower_id: current_user.id).map(&:followed)
    @user = User.find(current_user.id)
  end
end
  