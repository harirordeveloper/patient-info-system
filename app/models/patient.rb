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

end
