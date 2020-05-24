require 'pry'

class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if (sender.balance >= @amount) && valid? && @status == "pending"
      sender.balance -= @amount
      receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end

    if @status = "complete"
      last_transfer = [sender, receiver, amount]
    end

  end

  def reverse_transfer
    @sender = last_transfer[0]
    @receiver = last_transfer[1]
    @amount = last_transfer[2]
    @sender += @amount
    @receiver -= @amount
  end

end
