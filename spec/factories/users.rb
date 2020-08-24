FactoryBot.define do
  factory :user do
    nickname              { 'Furima' }
    first_name            { '不利' }
    last_name             { '魔太郎' }
    first_name_kana       { 'フリ' }
    last_name_kana        { 'マタロウ' }
    email                 { 'furima@gmail.com' }
    password              { '00000000' }
    password_confirmation { password }
    birth_date            { '1930-01-01 00:00:00' }
  end
end
