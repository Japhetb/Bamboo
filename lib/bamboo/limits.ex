defmodule Bamboo.Limits do
  @enforce_keys [:rate_limits, :cost, :user_name]
  defstruct [:rate_limits, :cost, :user_name]
end
