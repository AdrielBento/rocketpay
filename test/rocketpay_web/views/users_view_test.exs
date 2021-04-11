defmodule RocketpayWeb.UsersViewTest do
  use RocketpayWeb.ConnCase, async: true
  alias Rocketpay.{Account, User}

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders create.json" do
    params = %{
      name: "Adriel",
      password: "324435t",
      nickname: "teste",
      email: "suamae@gmail.com",
      age: 22
    }

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} =
      Rocketpay.create_user(params)

    response = render(RocketpayWeb.UsersView, "create.json", user: user)

    expected_response = %{
      account: %{balance: Decimal.new("0.00"), id: account_id},
      message: "User created",
      user: %{id: user_id, name: "Adriel"}
    }

    assert expected_response == response
  end
end
