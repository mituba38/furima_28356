FactoryBot.define do
  factory :item do
    # user                 { 'フリマ' }
    name                 { '醤油' }
    explanation          { 'だし醤油' }
    user_id              { '1' }
    category_id          { '1' }
    charge_id            { '1' }
    prefecture_id        { '1' }
    schedule_id          { '1' }
    status_id            { '1' }
    price                { '1000' }
    association :user
  end
end
