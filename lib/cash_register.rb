class CashRegister
    attr_reader :discount
    attr_accessor :total, :items, :last

    def initialize(value=0)
        @discount = value
        @total = 0
        @items = []
    end

    def add_item(title, price, quantity=1)
        self.total = self.total + (price * quantity)
        quantity.times do
            self.items << title
        end
        self.last = [price, quantity]
    end

    def apply_discount
        if discount > 0
            self.total = self.total - (self.total * (self.discount / 100.0))
            "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.last[1].times do
            self.items.pop()
            self.total = self.total - self.last[0]
        end
    end
end