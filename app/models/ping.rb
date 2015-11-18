class Ping < ActiveRecord::Base
    validates :uuid, uniqueness: true, presence: true
end
