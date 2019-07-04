class Blogger < ApplicationRecord
  validates :name, {presence: true, uniqueness: true}
  validates :age, {presence: true, numericality: { greater_than: 0 }}
  #validates bio_length
  has_many :post







  private
  def bio_length
    arr = :bio.split("")
    if arr.length <= 30
      errors.add(:bio, 'bio needs to be more than 30 characters')
    end
  end



  # validates validate_age
  #
  #
  # private
  #
  # def validate_age
  #     if :age <= 0
  #         errors.add(:age, 'You should be over 0 years old.')
  #     end
  # end

end
