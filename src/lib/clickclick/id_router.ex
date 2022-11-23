defmodule ClickClick.IdRouter do
  use Plug.Router

  plug :match
  plug :dispatch

  tokens = %{}

  get "/ID/:ID" do
    put_new(tokens, :ID, 0)
    put(tokens, :ID, get(tokens, :ID) + 1)
    token_count = get(tokens, :ID)
    send_resp(conn, 200, '<meta http-equiv="refresh" content="5"/>"#{token_count}<a href="./ID/#{token_count}>f</a><a href="./ID/#{token_count}>nf</a>')
  end

  match _ do
    send_resp(conn, 404, "fuck")
  end
end