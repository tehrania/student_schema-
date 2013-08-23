require_relative '../config'



class CreateNameColumn < ActiveRecord::Migration

  def up
    add_column :students, :name, :string 
    Student.find_each do |student|
      student.name = student.first_name + " " + student.last_name
      student.save
      #update_attributes
    end
    remove_column :students, :first_name
    remove_column :students, :last_name
  end

  def down
    add_column :students, :first_name, :string
    add_column :students, :last_name, :string 
    Student.find_each do |student|
      student.first_name, student.last_name  = student.name.split()
      student.save 
    end
    remove_column :name
  end 

end
