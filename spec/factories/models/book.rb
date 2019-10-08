# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    book_title { Faker::Games::LeagueOfLegends.champion }
    page_count { 100 }
  end
end