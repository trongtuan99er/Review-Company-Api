list_review = []
10.times do
  list_review.push(
    {
      company_id: Company.order("RANDOM()").limit(1).first.id,
      score: Faker::Number.between(from: 1, to: 10),
      title: Faker::Lorem.sentence,
      reviews_content: Faker::Lorem.paragraph,
      vote_for_quit: Faker::Number.between(from: 0, to: 1),
      is_anonymous: Faker::Number.between(from: 0, to: 1),
    }
  )
end
list_review.each do |review|
    Review.create(review)
    puts "config: #{review[:title]} created"
end
puts 'Company created'
