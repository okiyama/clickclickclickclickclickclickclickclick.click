defmodule ClickClick.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  Agent.start_link(fn -> %{} end, name: :shopping)

  get "/ID/:id" do
    #    tokens = %{}
    #    put_new(tokens, :id, 0)
    #    put(tokens, :id, get(tokens, :id) + 1)
    #    token_count = get(tokens, :id)
    #    send_resp(conn, 200, "<meta http-equiv=\"refresh\" content=\"5\"/>#{token_count}<a href=\"./ID/#{token_count}\">f</a><a href=\"./ID/#{token_count}\">nf</a>")
    send_resp(conn, 200, "hell #{id}")
  end

  match _ do
    send_resp(conn, 404, "fuck")
  end
end