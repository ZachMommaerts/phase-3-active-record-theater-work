class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.pluck(:actor)
    end

    def locations
        self.auditions.pluck(:location)
    end

    def lead
        self.auditions.where('hired = ?', true).first ? self.auditions.where('hired = ?', true).first : 'no actor has been hired for this role'
    end

    def understudy
        self.auditions.where('hired = ?', true).second ? self.auditions.where('hired = ?', true).second : 'no actor has been hired for this role'
    end
end