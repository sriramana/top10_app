# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_top10_app_session',
  :secret      => 'a8d0d54b0b23ab83fd97f962cf22a12eb9f639ab82245e54fb3a5b39ee0cc2987148c933bfc6ecc4e2a7ed0630d4c7c92478acfcf83c2b1820b96dc8ff547072'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
