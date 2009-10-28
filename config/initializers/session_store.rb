# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_devcon5_session',
  :secret      => '6b0bfeeb3ca2d771888ec48cc88ba15d7dd99d97bb99faf7fecc9e119bead90ea149a1a5896ea4c1e23201b69cf61041a3140a3d11f81fa9b2861e7b512b4578'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
ActionController::Base.session_store = :active_record_store