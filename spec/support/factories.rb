FactoryGirl.define do
  factory :user do
    email                 'test@example.com'
    password              'password'
    password_confirmation 'password'
  end

  factory :identities, class: Identities::Password do |f|
    f.type  'Identities::Password'
    f.uid   { ['test@example.com'] }
    f.token '400$8$43$ef77e238e144bef9$e62f2db358dff99699d210bdcef8a92cdd81a819ac9660f54b5fbb20da4ed56d'
  end
end
