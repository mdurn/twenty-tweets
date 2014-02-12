Fabricator :user, class_name: :user do
  password {Devise.friendly_token[0,20]}
  provider {'twitter'}
  uid {'450995293'}
  name {'mdurntest'}
  twitter_nickname {'mdurn_test'}
  twitter_uri {'https://twitter.com/mdurntest'}
  twitter_secret {'EKPnwpKlLDvb1c5H8sWbi0yEAancytLX2C8j0BEKo1cpT'}
end