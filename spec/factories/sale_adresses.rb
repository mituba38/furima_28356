FactoryBot.define do
  factory :sale_adress do
    postal_code { '123-4567' }
    prefecture_id { '3' }
    city { '八王子市' }
    address { '肉肉1-23' }
    building { '田中ビル' }
    phone_number { '0901234567' }
    token {'1234'}

    association :user
    association :item

  end
end
