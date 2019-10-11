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
    if @sender.balance < @amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif
      @sender.balance > @amount && @status = "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
       @status = "complete"
      "Transaction was already executed."
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
