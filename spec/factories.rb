FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :picpost do
    caption "Lorem ipsum"
    user
  end

  factory :picture_rating do
    comment "Lorem ipsum"
    rating true
    picpost
  end
 
end
