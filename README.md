# README

Sample rails 7 + graphql based on [this post](https://www.apollographql.com/blog/community/backend/using-graphql-with-ruby-on-rails/)

## Models

```ruby
ActiveRecord::Schema[7.0].define(version: 20_220_701_190_725) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'artists', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'email'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'items', force: :cascade do |t|
    t.bigint 'artist_id', null: false
    t.string 'title'
    t.text 'description'
    t.string 'image_url'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['artist_id'], name: 'index_items_on_artist_id'
  end

  add_foreign_key 'items', 'artists'
end
```

## Running

```shell
$ cp .env_sample .env
$ docker-compose build
$ docker-compose up
```

## Querying

Getting songs with artists
```shell
curl -g \
  -X POST \
  -H "Content-Type: application/json" \
  -d '{"query": "query { items { id title description artist { firstName lastName email fullName createdAt } } }"}' \
  http://localhost:3000/graphql
```

Getting all artists and the songs related
```shell
curl -g \
  -X POST \
  -H "Content-Type: application/json" \
  -d '{"query": "query { artists { id fullName email items { id title description imageUrl } } }"}' \
  http://localhost:3000/graphql
```
