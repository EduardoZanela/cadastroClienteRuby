require 'rails_helper'

RSpec.describe User, type: :model do
  context "User Validations" do
    it "Usuario valido?" do
      test =  User.new()
      test.name = 'Eduardo'
      test.city = 'Passo fundo'
      test.province = 'RS'
      test.country = 'EUA'
      test.birth_date = '02/07/1995'
      test.civil = 'Divorciado'
      test.sex = 'Masc'
      test.profession = 'Analista'
      expect(test.valid?).to be_truthy
    end
    it "Usuario Invalido?" do
      test =  User.new()
      test.name = 'Eduardo'
      test.city = 'Passo fundo'
      test.province = 'RS'
      test.country = 'EUA'
      test.birth_date = '02/07/1995'
      test.civil = 'Divorciado'
      test.profession = 'Analista'
      expect(test.valid?).to be_falsey
    end
    it "Criando Usuario!" do
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
      test.destroy
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
    it "Capybara Sign Test" do
      Systemuser.create(email: 'eduardogzanela@gmail.com', password: '123456')
      visit '/login'


      fill_in 'email', with: 'eduardogzanela@gmail.com'
      fill_in 'password', with: '123456'


      click_button 'Log In'


      expect(current_path).to eql('/')


      #expect(page).to have_content 'Usuario ou senha incorretos'

    end
    it "Test Capybara" do
      loginUser
      expect(page).to have_content 'Sistema'

    end
  end
end