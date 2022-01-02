defmodule Bamboo.ExternalApiNews.Supervisor do

  alias Bamboo.ExternalApiNews

  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def init(opts) do
    children = [
      {Task.Supervisor, name: ExternalApiNews.TaskSupervisor}
    ]
    Supervisor.init(children, strategy: :rest_for_one)
  end

end
