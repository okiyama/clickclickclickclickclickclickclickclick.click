defmodule ClickClick.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  def newId do
#   https://hashrocket.com/blog/posts/the-adventures-of-generating-random-numbers-in-erlang-and-elixir#using-code-rand-code-in-elixir
    << i1 :: unsigned-integer-32, i2 :: unsigned-integer-32, i3 :: unsigned-integer-32>> = :crypto.strong_rand_bytes(12)
    :rand.seed(:exsplus, {i1, i2, i3})
    :rand.uniform(9007199254740991) # generate random number from 0 - MAX_SAFE_INTEGER = 9007199254740991 https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MAX_SAFE_INTEGER
  end

  def newIdAHref(body) do
    "<a href=\"./ID/#{newID()}\">#{body}</a>"
  end

  get "/" do
    send_resp(conn, 200, newIdAHref("welcome"))
  end

  def send_banned do
    send_resp(conn, 200, newIdAHref("banned"))
  end

  get "/ID/:id" do
    ClickClick.Tokens.put_new(id, 1)
    token_count = ClickClick.Tokens.get(id)
    if token_count < 0 do
      send_banned()
    end

    ClickClick.Tokens.put(id, ClickClick.Tokens.get(id) + 1)
    token_count = ClickClick.Tokens.get(id)
    send_resp(conn, 200, "#{token_count}<a href=\"./\">f</a><a href=\"./nf\">nf</a>")
  end

  get "/ID/:id/nf" do
    ClickClick.Tokens.ban(id)
    send_banned()
  end

  match _ do
    send_resp(conn, 404, newIdAHref("fuck"))
  end
end
