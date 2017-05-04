class User < ApplicationRecord
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      User.create! row.to_hash
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
