# README

# Info

In seeds you can find partners which created around Berlin.
For testing please use some address from Verlin city.
You can get any address from Google Maps and request the api.

Allowed flooring materials: wood | carpet | tiles

# Docker startup

- docker compose -f docker-compose.dev.yml up

# Pure rails startup

1. bundle install
2. rails db:create
3. rails db:migrate
4. rails db:seed
5. rails s

# Api docs

http://localhost:3000/api-docs

# Tests

- rspec spec

Coverage: 100%
Rubocop: pass
