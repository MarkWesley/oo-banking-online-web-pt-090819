class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if  @sender.balance > @amount && @status == "pending"
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
    elsif @sender.balance > @amount && @status == "complete"
      @sender.balance = @sender.balance
      @receiver.balance = @receiver.balance
    else
      @sender.balance < @amount
      @status = "rejected"
        "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
     @sender.balance += @amount
     @receiver.balance -= @amount
     @status = "reversed"
   end
 end

end
