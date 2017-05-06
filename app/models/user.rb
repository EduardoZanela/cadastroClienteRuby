class User < ApplicationRecord
  def self.import(file)
    @map = Hash.new
    @map["sucess"] = "Sucesso na importação do arquivo"
    CSV.foreach(file.path, headers: true) do |row|
      user = User.new row.to_hash
      if(user.valid?)
        user.save
      else
        @map["sucess"] = "Erro na importação do arquivo, verifique. "
        @map[$.] = user.errors.full_messages
        puts "deu cagada"
      end
    end
    puts @map["sucess"]
    return @map
  end

  def self.to_csv
    attributes = %w{name city province country birth_date civil sex profession}

    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |user|
        csv << attributes.map{ |attr| user.send(attr) }
      end
    end
  end

  validates :name, presence: true
  validates :city, presence: true
  validates :province, presence: true
  validates :country, presence: true
  validates :birth_date, presence: true
  validates :civil, presence: true
  validates :sex, presence: true
  validates :profession, presence: true
end
