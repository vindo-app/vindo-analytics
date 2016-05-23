class Ping < ActiveRecord::Base
    validates_uniqueness_of :uuid
    validates_presence_of :uuid
    validates_format_of :uuid, :with => /\A[a-z]{40}\Z/

    validates_presence_of :version

    validates_presence_of :ip
    # validates_format_of :ip, :with => /\A\d{1,3}.\d{1,3}.\d{1,3}.\d{1,3}\Z/

    has_and_belongs_to_many :programs

    def hashify
        {
            "uuid" => uuid,
            "version" => version
        }
    end
end
