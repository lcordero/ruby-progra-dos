class Pharmacy < ApplicationRecord
 has_many :exams, dependent: :destroy
end
