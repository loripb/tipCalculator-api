class Tip < ApplicationRecord
  belongs_to :user

  # calculation methods
  def calculate_percent
    total = 0

    case self.tip_percent
    when 10
      total = 0.10 * self.total.to_f
    when 15
      total = 0.15 * self.total.to_f
    when 20
      total = 0.20 * self.total.to_f
    else
      total = ( self.tip_percent.to_f / 100) * self.total.to_f
    end

    self.update(tip_amount: total)
  end

  def get_grand_total
    grand_total = self.total.to_f + self.fees.to_f + self.tip_amount.to_f

    self.update(grand_total: grand_total)
  end

  def run_calculations
    calculate_percent
    get_grand_total
  end

end
