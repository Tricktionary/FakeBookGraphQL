module Types
    class UploadType < Types::BaseObject
        field :name String!, null: false
        field :size Int!, null: false
        field :path: String! null: false
        field :type: String! null: false
    end
end