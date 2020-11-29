class ImportsController < ApplicationController
  def index
    sort_order = "#{params[:sort]} #{params[:dir]}"
    @imports = Import.includes(:customer).order(sort_order)

    respond_to :html
  end

  def show
    @import = Import.includes(:customer)
                    .where(id: params[:id])
                    .order('imports.start_time desc').first

    respond_to :html
  end

  def export
    filename = "imports_#{Time.now.localtime.strftime('%Y-%m-%d_%H%M')}.csv"
    respond_to do |format|
      format.csv { send_data imports_to_csv, filename: filename }
    end
  end

  private

  def imports_to_csv
    imports = Import.where(customer_id: params[:customer_id])
    attributes = %w[id customer_id start_time end_time duration status
                    identifier created_at updated_at]

    CSV.generate(headers: true) do |csv|
      csv << attributes
      imports.each { |import| csv << import.attributes.values }
    end
  end
end
