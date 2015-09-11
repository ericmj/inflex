defmodule Inflex do
  defmacro __using__([]) do
    quote do
      import Inflex.Camelize
      import Inflex.Pluralize
      import Inflex.Parameterize
      import Inflex.Underscore
    end
  end
end
