class BatchesProduct < ApplicationRecord
  belongs_to :batch
  belongs_to :product
end
