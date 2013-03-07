# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
Xdpogo::Application.config.secret_token = ENV['SESSION_SECRET'] || "68ad6e10103c2f6cd8c1560774baf9aceda9a2fc389b9342283d7ebb1fa37dd749f7a5cfe0e6bcf6965b576cae081871ff4a9580dec282d17fe4613301b3033d"

