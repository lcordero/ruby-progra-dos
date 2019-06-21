class Dark < ApplicationRecord
validates_references_of:usuario
validates_references_of:titulo
end
