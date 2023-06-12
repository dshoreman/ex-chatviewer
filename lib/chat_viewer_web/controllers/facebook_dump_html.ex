defmodule ChatViewerWeb.FacebookDumpHTML do
  use ChatViewerWeb, :html

  embed_templates "facebook_dump_html/*"

  @doc """
  Renders a facebook_dump form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def facebook_dump_form(assigns)
end
