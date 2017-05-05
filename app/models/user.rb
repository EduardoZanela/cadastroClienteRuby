class User < ApplicationRecord
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      begin
        User.create! row.to_hash
      rescue
        puts 'ERROOOOOOOO'
      end
    end
  end

  def self.to_csv
    attributes = %w{name city province birth_date civil sex profession}

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
  validates :birth_date, presence: true
  validates :civil, presence: true
  validates :sex, presence: true
  validates :profession, presence: true
end
