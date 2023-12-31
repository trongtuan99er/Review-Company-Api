list_review = []
10.times do
  list_review.push(
    {
      score: Faker::Number.between(from: 1, to: 10),
      title: Faker::Lorem.sentence,
      reviews_content: Faker::Lorem.paragraph,
      vote_for_quit: Faker::Number.between(from: 0, to: 1),
      is_anonymous: Faker::Number.between(from: 0, to: 1),
    }
  )
end
Area.where(status: :active).each do |tenant|
  tenant.change_tenant do
    puts "current_tenant is #{tenant.name}"
    list_review.each do |review|
      review.merge!( company_id: Company.order("RANDOM()").limit(1).first.id)
      Review.create(review)
      puts "review: #{review[:title]} created"
    end
    puts 'reviews created'
  end
end

