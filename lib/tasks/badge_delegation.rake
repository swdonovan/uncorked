namespace :badge_delegation do
  desc "Check all users for eligibility of a badge and award them"
  task check_eligibility: :environment do
    users = User.all
    @eligible = users.map do |user|
                  if user.reviews.count >= 10
                    if user.badges.count == 0
                      user
                    end
                  end
  end

  # desc "reward badges to those meeting criteria"
  # task reward_badges: :environment do
  #   # eligible.each do |user|
  #   #  user.badges.create(badge_id: 1)
  #   # end
  # end
end
