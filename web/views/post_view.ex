defmodule PhoenixEntries.PostView do
  use PhoenixEntries.Web, :view

  def html_content(content) do
    {:safe, Earmark.to_html(content)}
  end
end
