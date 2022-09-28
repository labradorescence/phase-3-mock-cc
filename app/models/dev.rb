class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies


    def received_one?(item_name)
        self.freebies.each do |freebie|
            return true if freebie.item_name===item_name
        end
        false
    end

    def give_away(dev,freebie)
        if (dev.freebies.includes(freebie))
            dev.freebies.delete(freebie.id)
            self.freebies << freebie
        end
    end

end
