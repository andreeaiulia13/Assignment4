FactoryBot.define do
  factory :user do 
    name  { 'Example' } 
    email { 'example11@gmail.com' }
    password { '123456' }
    password_confirmation { '123456' }
  end
end
