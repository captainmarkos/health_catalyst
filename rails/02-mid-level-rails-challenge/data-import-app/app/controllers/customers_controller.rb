class CustomersController < ApplicationController
  def index
    sort_order = "#{params[:sort]} #{params[:dir]}"
    @customers = Customer.includes(:imports, :partner)
                         .by_import_status(params[:status])
                         .order(sort_order)

    respond_to :html
  end

  def show
    @customers = Customer.includes(:imports)
                         .where(id: params[:id])
                         .order('imports.start_time desc')

    respond_to :html
  end
end
