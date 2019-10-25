require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "2ba1b7bb2dd9448ab9ae4c7614d95728", "348bf5615fe34fb88c88508b215bc649", scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
end