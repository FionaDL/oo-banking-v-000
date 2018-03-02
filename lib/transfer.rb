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
      if @sender.valid?
        @receiver.balance += @amount
        @sender.balance -= @amount
        self.@status = "complete"
      else
        @status = rejected
        "Transaction rejected. Please check your account balance."
      end
    end
end
