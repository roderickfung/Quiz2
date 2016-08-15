class Support < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :department, presence: true
  validates :message, presence: true

  before_validation :set_complete_default

  def self.search(v)
      where("name ILIKE ? OR message ILIKE ? OR email ILIKE ? OR department ILIKE ?", "%#{v}%", "%#{v}%","%#{v}%","%#{v}%")
  end

  private

  def set_complete_default
    self.complete ||= false
  end

end
