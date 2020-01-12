defmodule Scatter do
  require Logger
  require Action
  @moduledoc """
  Documentation for Scatter.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Scatter.hello()
      :world

  """
  def hello do
    :world
  end

  @doc """

  """
  def test_call do
    Action.call
  end

  def test_json_read do
    Reader.get_json("./process.json")
  end

  def test_yml_read do
    path = Path.join(File.cwd!(), "process.yml")
    Reader.get_yml(path)
  end


end
