module OutletsHelper
  def display_full_address(address)
    return '' if address.blank?


    "#{address['city']}, #{address['street']}, д. #{address['apartment']}, #{address['block']}"
  end

  def display_title_address(address)
    return '' if address.blank?

    "#{address['street']}"
  end
end
