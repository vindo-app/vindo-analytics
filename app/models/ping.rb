class Ping < ActiveRecord::Base
    validates :uuid, uniqueness: true, presence: true

    def hashify
        {
            "uuid" => uuid,
            "version" => version
        }
    end
end
