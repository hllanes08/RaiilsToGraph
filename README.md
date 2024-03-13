# Setup Instructions
## Setup your environment variable on docker-compose.yml file
Setup the following environment variables
  * DATABASE: postgres://postgres:postgres@db:5432
  * DEVISE_JWT_SECRET_KEY: 'yourdevisecret'
## Build project runing docker
```
docker-compose build
```
## Run repo with docker
```
docker-compose up
```
## Exec container
```
docker ps
```
```
docker exec -it containerid bash
```
## Run migration
```
rake db:create
rake db:migrate
```
## Add user
```
rails c
```
```
User.creat(email: 'test.user@mail', password: 'UserTestPassword', password_confirmation: 'UserTestPassword')
```
## Test login
```
curl --location 'http://localhost:3000/api/users/sign_in' \
--header 'Content-Type: application/json' \
--data-raw '{
    "email": "user.test@mail",
    "password": "UserTestPassword"
}'
```

## Run test
```
bundle exec rspec
```
