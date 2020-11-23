# == Schema Information
#
# Table name: patients
#
#  id             :bigint           not null, primary key
#  name           :string
#  email          :string
#  gender         :integer
#  dob            :date
#  marital_status :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Patient < ApplicationRecord
  require 'csv'
  enum gender: %w(Male Female)
  enum marital_status: %w( Married UnMarried)

  has_many_attached :medical_records, dependent: :purge_later

  # # and validation macros
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates_format_of :email, with:  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  extend FriendlyId
  friendly_id :name, use: :slugged

  def self.import file
    CSV.foreach(file.path, headers: true) do |row|
      Patient.create!(row.to_hash)
    end
  end
end
