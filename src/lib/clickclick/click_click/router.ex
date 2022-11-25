defmodule ClickClick.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  def new_id do
    #   https://hashrocket.com/blog/posts/the-adventures-of-generating-random-numbers-in-erlang-and-elixir#using-code-rand-code-in-elixir
    <<i1::unsigned-integer-32, i2::unsigned-integer-32, i3::unsigned-integer-32>> =
      :crypto.strong_rand_bytes(12)

    :rand.seed(:exsplus, {i1, i2, i3})

    # generate random number from 0 - MAX_SAFE_INTEGER = 9007199254740991 https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MAX_SAFE_INTEGER
    :rand.uniform(9_007_199_254_740_991)
  end

  def new_id_a_href(body) do
    "<a href=\"/ID/#{new_id()}\">#{body}</a>"
  end

  get "/" do
    send_resp(conn, 200, new_id_a_href("welcome"))
  end

  def send_banned(conn) do
    send_resp(conn, 200, new_id_a_href("banned"))
  end

  get "/ID/:id" do
    ClickClick.Tokens.init_if_not_exists(id)

    if ClickClick.Tokens.is_banned(id) < 0 do
      send_banned(conn)
    else
      ClickClick.Tokens.increment(id)

      put_resp_content_type(conn, "text/html", "utf-8")
      send_resp(
        conn,
        200,
        "<html>#{ClickClick.Tokens.get(id)}<a href=\"/ID/#{id}\">f</a><a href=\"/ID/#{id}/nf\">nf</a>"
      )
    end
  end

  get "/ID/:id/nf" do
    ClickClick.Tokens.ban(id)
    send_banned(conn)
  end

  match _ do
    send_resp(conn, 404, new_id_a_href("fuck"))
  end
end
