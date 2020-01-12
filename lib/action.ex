defmodule Action do
  require Logger

  @doc """

  """
  def call do
    {:ok, conn} = Mint.HTTP.connect(:http, "localhost", 8080)
    Logger.info "Run github call"
    {:ok, conn, request_ref} =
      Mint.HTTP.request(conn, "GET", "/api/for/test", [
        {"content-type", "application/json"}
      ], "")

    # read and parse the response
    receive do
      message ->
        {:ok, conn, responses} = Mint.HTTP.stream(conn, message)

      for response <- responses do
        case response do
          {:status, ^request_ref, status_code} ->
            IO.puts("> Response status code #{status_code}")

          {:headers, ^request_ref, headers} ->
            IO.puts("> Response headers: #{inspect(headers)}")

          {:data, ^request_ref, data} ->
            IO.puts("> Response body")
            IO.puts(data)

          {:done, ^request_ref} ->
            IO.puts("> Response fully received")
        end
      end
    end

    # close the HTTP connection
    Mint.HTTP.close(conn)
    {:ok}
  end
end
