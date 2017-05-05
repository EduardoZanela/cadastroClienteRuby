require 'rails_helper'

RSpec.describe User, type: :model do
  context "User Validations" do
    it "valid user?" do
      test =  User.new()
      test.name = 'Eduardo'
      test.city = 'Passo fundo'
      test.province = 'RS'
      test.country = 'EUA'
      test.birth_date = '02/07/1995'
      test.civil = 'Divorciado'
      test.profession = 'Analista'
      expect(test.valid?).to be_truthy
    end
    it "Create User!" do
      test =  User.new()
      test.name = 'Eduardo'
      test.city = 'Passo fundo'
      test.province = 'RS'
      test.country = 'EUA'
      test.birth_date = '02/07/1995'
      test.civil = 'Divorciado'
      test.sex = 'Masculino'
      test.profession = 'Analista'
      expect(test.save).to be_truthy
    end
    it "Delete User!" do
      test =  User.new()
      test.name = 'Eduardo'
      test.city = 'Passo fundo'
      test.province = 'RS'
      test.country = 'EUA'
      test.birth_date = '02/07/1995'
      test.civil = 'Divorciado'
      test.sex = 'Masculino'
      test.profession = 'Analista'
      test.save
      expect(test.destroy).to be_truthy
    end
    it "List All Users!" do
      test = User.all
      expect(test).to be_truthy
    end
  end
end