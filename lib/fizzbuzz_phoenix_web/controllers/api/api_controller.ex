defmodule FizzbuzzPhoenixWeb.Api.ApiController do
  use FizzbuzzPhoenixWeb, :controller



  @page_size 100

  def index(conn, params) do

    page_number = FizzbuzzPhoenixWeb.PageController.get_param_value(params, "page", 1)
    page_size = FizzbuzzPhoenixWeb.PageController.get_param_value(params, "page_size", @page_size)
    first_number_of_current_page = 1 + (page_number-1)*page_size
    last_number_of_current_page = (page_size-1) + first_number_of_current_page
    sequence = Enum.map(first_number_of_current_page..last_number_of_current_page, &FizzbuzzPhoenixWeb.PageController.fetch_or_generate_fizzbuzz_element/1)

    json(conn, %{data: sequence})

  end


end