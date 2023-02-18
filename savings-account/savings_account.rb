module SavingsAccount
  def self.interest_rate(balance)
    if balance < 1000 && balance >= 0
      0.5
    elsif balance >= 1000 && balance < 5000
      1.621
    elsif balance >= 5000
      2.475
    elsif balance.negative?
      3.213
    end
  end

  def self.annual_balance_update(balance)
    balance + (balance * interest_rate(balance)) / 100
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    total = current_balance
    number_of_years = 0

    until total > desired_balance
      total = annual_balance_update(total)
      number_of_years += 1
    end

    number_of_years
  end
end
