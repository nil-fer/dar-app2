# frozen_string_literal: true

module CompaniesHelper
  def company_categories
    Company.company_categories.collect do |k, v|
      k
    end
  end
end
