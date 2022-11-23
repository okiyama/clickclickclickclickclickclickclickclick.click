defmodule ClickClick.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  forward "/", to: ClickClick.IdRouter

  match _ do
    send_resp(conn, 404, "fuck")
  end
end