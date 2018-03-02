require 'pry'

class Transfer

    attr_accessor :sender, :receiver, :status, :amount

    def initialize (sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = "pending"
    end

    def valid?
      if @sender.valid? == true && @receiver.valid? == true
        true
      end
    end

    def execute_transaction
      if @sender.valid? && self.status == "pending" && sender.balance > amount
        @receiver.balance += @amount
        @sender.balance -= @amount
        self.status = "complete"
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
end
