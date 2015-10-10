defmodule PhoenixEntries.PostView do
  use PhoenixEntries.Web, :view

  def html_content(content) do
    safe_content = Phoenix.HTML.Safe.to_iodata(content)
    {:safe, Earmark.to_html(safe_content)}
  end
end
