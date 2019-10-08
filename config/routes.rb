# frozen_string_literal: true

Rails.application.routes.draw do
  # GraphQL API Editor
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  end

  post '/graphql', to: 'graphql#execute'
end
