class User < ApplicationRecord
  def self.import(file)
    @map = Hash.new
    @map["noError"] = false
    if file == nil
      return @map
    end
    if File.extname(file.path) != '.csv'
      puts 'File.extname(file.path)'
      return @map
    end
    @map["sucess"] = "Sucesso na importação do arquivo"
    CSV.foreach(file.path, headers: true) do |row|
      user = User.new row.to_hash
      if(user.valid?)
        user.save
      else
        @map["noError"] = false
        @map["sucess"] = "Erro na importação de alguns registros, verifique. "
        @messages = Hash.new
        user.errors.full_messages.each do |message, index|
          @messages[index] = message
        end
        @map[$.] = @messages
      end
    end
    @map["noError"] = true
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
