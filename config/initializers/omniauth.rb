

Rails.application.config.middleware.use OmniAuth::Builder do
 # provider :developer unless Rails.env.production?
  provider :github, '733153216af5501a99b6', '232b4f2cf23926abdc085017f99a730ec7d34721'
  provider :facebook, '586477458510794', 'd678dfb6875f8b99be599bfc16459515'
end

