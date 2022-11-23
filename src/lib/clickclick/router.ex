defmodule ClickClick.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)


  get "/ID/:id" do
    ClickClick.Tokens.put_new(id, 1)
    token_count = ClickClick.Tokens.get(id)
    if token_count < 0 do
        send_resp(conn, 200, "banned")
    end

    ClickClick.Tokens.put(id, ClickClick.Tokens.get(id) + 1)
    token_count = ClickClick.Tokens.get(id)
    send_resp(conn, 200, "<meta http-equiv=\"refresh\" content=\"5\"/>#{token_count}<a href=\"./\">f</a><a href=\"./nf\">nf</a>")
  end

  get "/ID/:id/nf" do
    ClickClick.Tokens.ban(id)
    send_resp(conn, 200, "banned")
  end

  match _ do
    send_resp(conn, 404, "fuck")
  end
end
