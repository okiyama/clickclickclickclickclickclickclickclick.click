defmodule ClickClick.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get "/ID/:id" do
    #    tokens = %{}
    #    put_new(tokens, :id, 0)
    #    put(tokens, :id, get(tokens, :id) + 1)
    #    token_count = get(tokens, :id)
    #    send_resp(conn, 200, "<meta http-equiv=\"refresh\" content=\"5\"/>#{token_count}<a href=\"./ID/#{token_count}\">f</a><a href=\"./ID/#{token_count}\">nf</a>")
    ClickClick.Bucket.put_new(id, 1)
    ClickClick.Bucket.put(id, ClickClick.Bucket.get(id) + 1)
    send_resp(
      conn,
      200,
      "hell #{id} #{ClickClick.Bucket.get(id)}"
    )
  end

  match _ do
    send_resp(conn, 404, "fuck")
  end
end
