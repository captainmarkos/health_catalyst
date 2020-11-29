module CustomersHelper
  def latest_import(customer)
    customer.imports.order(start_time: :desc).first if customer.present?
  end

  def options_for_status_select(selected)
    options = %w[succeeded running queued failed cancelled]
    options_for_select(options, selected)
  end
end
