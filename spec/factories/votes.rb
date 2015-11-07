include RandomData

FactoryGirl.define do
   factory :vote do
      topic
      user
      rank 0.0
   end
end