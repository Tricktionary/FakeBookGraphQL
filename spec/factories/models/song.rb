# frozen_string_literal: true

FactoryBot.define do
  factory :song do
    name { Faker::Games::LeagueOfLegends.champion }
    page_range_start { 10 }
    page_range_end { 20 }
    page_count { 10 }
    association :book, factory: :book
  end
end
