namespace :badge_delegation do
  desc "Check all users for eligibility of a badge"
  task check_eligibility: :environment do

    # eligible = User.joins(:reviews).where(reviews.count) == 10
  end

  desc "reward badges to those meeting criteria"
  task reward_badges: :environment do
    # eligible.each do |user|
    #  user.badges.create(badge_id: 1)
    # end
  end
end
