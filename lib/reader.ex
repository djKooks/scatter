defmodule Reader do
  require Logger
  require Poison
  require YamlElixir

  defmodule TargetDomain do
    @derive [Poison.Encoder]
    defstruct [:host, :port]
  end

  @spec get_json(
          binary
          | maybe_improper_list(
              binary | maybe_improper_list(any, binary | []) | char,
              binary | []
            )
        ) :: :ok | {:error, any}
  def get_json(file_name) do
    with {:ok, file_content} <- File.read(file_name) do
      mapped = Poison.decode!(file_content, as: %TargetDomain{})
      Logger.info("Map data: #{Map.get(mapped, :port)}")
    end
  end

  @spec get_yml(any) :: :ok | {:error, any}
  def get_yml(file_name) do
    Logger.info("get_yml:$#{file_name}")
    result = file_name |> YamlElixir.read_from_file!
    api = get_in(result, ["test", "request", "api"])
    Logger.info("Map data: #{api}")
    # result["host"]
  end

end
