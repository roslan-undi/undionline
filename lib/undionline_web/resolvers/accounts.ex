defmodule UndionlineWeb.Resolvers.Accounts do
  alias Undionline.Accounts
  alias Undionline.Accounts.User

  def create_user(_parent, args, _context) do
    Accounts.register_user(args)
  end

  def login(%{email: email, password: password}, _info) do
    with %User{} = user <- Accounts.get_user_by_email_and_password(email, password),
         {:ok, jwt, _full_claims} <- Undionline.Guardian.encode_and_sign(user) do
      {:ok, %{token: jwt}}
    else
      _ -> {:error, "Incorrect email or password"}
    end
  end
end