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
require 'rails_helper'

RSpec.describe Patient, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
