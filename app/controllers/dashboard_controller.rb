class DashboardController < ApplicationController
  def index
  end

  def fetch_data
    client = OpenStreetMap::Client.new
    data = client.reverse(format: 'json', lat: params[:lat], lon: params[:lng], accept_language: 'en')
    render json: {success: true, data: data}
  end
end
