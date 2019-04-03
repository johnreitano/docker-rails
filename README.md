Based on https://auth0.com/blog/ruby-on-rails-killer-workflow-with-docker-part-1/

* Step 1:
```
mkdir rails_app
cp Gemfile.rails-only rails_app/Gemfile
touch rails_app/Gemfile.lock
docker-compose build web
docker-compose run --user $(id -u):$(id -g) web rails new . --force --database=postgresql --skip-bundle --skip-coffee
cat Gemfile.extras >> rails_app/Gemfile
docker-compose up
```

* Step 2:
Replace:
```
  encoding: unicode
```

with:
```
  encoding: unicode
  host: db
  user: postgres
  port: 5432
  password:
```

* Step 3:
```
docker-compose down
docker-compose up --build
```

* Step 4:
```
docker-compose run web rails db:create
```
