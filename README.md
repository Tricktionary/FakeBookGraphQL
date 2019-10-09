# FakeBookGraphQL

A fakebook is a form of musical notation that specifies the essential elements of a popular song: the melody, lyrics and harmony. The melody is written in modern Western music notation, the lyric is written as text below the staff and the harmony is specified with chord symbols above the staff.

This GraphQL api allows users to upload books and have the book stored into active storage

## Schema

- Book
    - Has many songs
    - pdf

- Song:
    - Page in book
    - Title
    - Reference to the associated pdf
    - song start page
    - song end page
    - pdf

## Geting Started

Before cloning the repo make sure you have ruby and rails installed on your machine

- run `bundle intall` to install all ruby gems related to the project
- run `rails db:setup` to migrate the database and seed it with data
- run `rails s`
- Go to `localhost:4000/graphiql` to interact with the GraphQL interface

## Operations

## Testing

I used rspec in order to test individual models and there validation

- run `bundle exec rspec` in order to run the test 
