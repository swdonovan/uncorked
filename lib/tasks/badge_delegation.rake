namespace :badge_delegation do
  desc "Check all users who have given a review for eligibility of All Star Reviewer badge and award them"
  task check_eligibility: :environment do
    puts "Finding users with reviews"
    reviewers = User.joins(:reviews).distinct
    star_performer = Badge.where(name: "All Star Performer")
    eligible = []

    puts "#{reviewers.count} Reviewers found"

    reviewers.each do |user|
      if user.reviews.count >= 10 && user.badges.count == 0
        eligible << user
      end
    end

    puts "#{eligible.count} users eligible for the All Star Performer badge found"

    eligible.each do |user|
      user.badges << star_performer
    end

    puts "Eligible users were awarded badge"
  end
end
