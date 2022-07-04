# README

This is an API written with Rails + GraphQL that returns all AC/DC albums and their songs.

## Models

```ruby
ActiveRecord::Schema[7.0].define(version: 2022_07_04_143914) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string "name"
    t.string "cover_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.bigint "album_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_songs_on_album_id"
  end

  add_foreign_key "songs", "albums"
end
```

## Running

```shell
$ cp .env_sample .env
$ docker-compose build
$ docker-compose run --rm web rake db:create db:migrate db:seed
$ docker-compose up
```

## Querying

Getting all albums
```shell
curl -g \
  -X POST \
  -H "Content-Type: application/json" \
  -d '{"query": "query { albums { id name coverImage } }"}' \
  http://localhost:3000/graphql
```

Getting one album with all songs
```shell
curl -g \
  -X POST \
  -H "Content-Type: application/json" \
  -d '{"query": "query { album(id: 5) { id name coverImage songs { id name } } }"}' \
  http://localhost:3000/graphql
```

Getting one song with album information
```shell
curl -g \
  -X POST \
  -H "Content-Type: application/json" \
  -d '{"query": "query { song(id: 100) { id name album { id name coverImage } } }"}' \
  http://localhost:3000/graphql
```

# Developing

## Generating a new entity

```bash
$ rails g model Album artist:references name:string cover_image:string
$ rails g graphql:object album
$ rails g graphql:mutation_create Album
$ rails g graphql:mutation_update Album
$ rails g graphql:mutation_delete Album
```
