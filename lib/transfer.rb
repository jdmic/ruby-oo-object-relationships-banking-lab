require "pry"
class Transfer

  @@all = []
  attr_reader :sender, :receiver
  attr_accessor :sender, :receiver,  :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender=sender
    @receiver=receiver
    @status="pending"
    @amount=amount
    @@all << self
  end

  def valid?
    if @sender.valid? == @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    #binding.pry
    if valid? && @sender.balance>@amount && @status==("pending")
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
       @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    #binding.pry
    if valid? && @receiver.balance>@amount && @status==("complete")
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end


end
