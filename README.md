# FakeBookGraphQL

A fakebook is a form of musical notation that specifies the essential elements of a popular song: the melody, lyrics and harmony. The melody is written in modern Western music notation, the lyric is written as text below the staff and the harmony is specified with chord symbols above the staff.

This GraphQL api allows users to upload books and have the book stored into active storage

## Model 

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

## Capabilities

- Search song by title or page number
- Browse books
- Browse songs 
- Upload books

 
