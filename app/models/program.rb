class Program < ActiveRecord::Base
    validates_presence_of :name

    has_and_belongs_to_many :pings

    def self.with_name(name)
        self.find_by_name(name) || self.create(name: name)
    end
end
