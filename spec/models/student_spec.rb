require 'rails_helper'

RSpec.describe Student, type: :model do
  describe "Instance methods" do
    it {should have_many :professors}
    it {should have_many :professor_students}
  end

  describe "Testing average_age method" do
    it " testing average age" do
    mulan = Professor.create(name: "Mulan Senior", age: 25, specialty: "Flying")
    jen = Professor.create(name: "Emi Star", age: 34, specialty: "Potions")
    d = Student.create(name: "Dmytri Nguyen", age: 6)
    l = Student.create(name: "Lana Nguyen", age: 4)
    k = Student.create(name: "Khoa Nguyen", age: 35)

    ProfessorStudent.create(professor: mulan, student: k)
    ProfessorStudent.create(professor: mulan, student: l)
    ProfessorStudent.create(professor: mulan, student: d)
    ProfessorStudent.create(professor: jen, student: l)
    ProfessorStudent.create(professor: jen, student: d)

    expect(mulan.students.average_age).to eq(15.0)
   end
  end
end
