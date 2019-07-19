class Usuario < ApplicationRecord
  has_many :datilusers, dependent: :destroy
end
