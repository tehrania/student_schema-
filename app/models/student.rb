require_relative '../../db/config'

class Student < ActiveRecord::Base
  # implement your Student model here
  validates :email, :uniqueness => true, :format => { :with => /.+@.+\..{2,}/ } 
  validates :age, :numericality => {:greater_than => 5 }
  validates :phone, :format => { :with => /\(?\d{3}\)?[-\s]?\d{3}-?\d{4}\s?x?\d*/ }


  def name
    "#{self.first_name + " " + self.last_name}"
  end

  def age
    now = Date.today 
    (now.year - self.birthday.year) - ((now.month > self.birthday.month || (now.month == self.birthday.month && now.day >= self.birthday.day)) ? 0 : 1)
  end
end
