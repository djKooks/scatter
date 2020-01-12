defmodule Mix.Tasks.Call do
  use Mix.Task

  @shortdoc "Simply calls the Scatter.test_call/0 function."
  def run(_) do
    # calling our Hello.say() function from earlier
    # Scatter.test_call()
    # Scatter.test_json_read()
    Scatter.test_yml_read()
  end
end
