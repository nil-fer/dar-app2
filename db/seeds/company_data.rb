def create_companies
  create_company(
    company_name: 'Перекресток',
    retailer_email: 'retailer@perekrestok.com'
  )
  create_company(
    company_name: 'Братья Караваевы',
    retailer_email: 'retailer@karavaev_brothers.com'
  )
  create_company(
    company_name: 'МакДоналдс',
    retailer_email: 'retailer@mcdonalds.com'
  )
  create_company(
    company_name: 'Французская пекарня',
    retailer_email: 'retailer@french_bakery.com'
  )
end

def create_company(company_name:, retailer_email:)
  company = Company.create(
    company_name: company_name,
    company_cover: random_cover,
    company_category: Company.company_categories.keys.sample
  )
  company.save!

  User.find_by_email(retailer_email).update(
    company_id: company.id
  )
end

def random_cover
  uploader = CompanyCoverUploader.new(Company.new, :company_cover)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'lib/assets/company_covers', '*')).sample))
  uploader
end
