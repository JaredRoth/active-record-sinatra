class Film < ActiveRecord::Base
  def self.total_sales
    sum(:box_office_sales)
  end

  def self.average_sales
    average(:box_office_sales)
  end
end
