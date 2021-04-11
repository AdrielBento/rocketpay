defmodule Rocketpay.CreateTest do
  use Rocketpay.DataCase, async: true

  alias Rocketpay.Users.Create
  alias Rocketpay.User

  describe "call/1" do
    test "When all params are valid, returns an users" do
      params = %{
        name: "Adriel",
        password: "324435t",
        nickname: "teste",
        email: "suamae@gmail.com",
        age: 22
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{name: "Adriel", age: 22, id: ^user_id} = user
    end

    test "When there are invalid params, returns an users" do
      params = %{
        name: "Adriel",
        nickname: "teste",
        email: "suamae@gmail.com",
        age: 22
      }

      expected_response = %{password: ["can't be blank"]}

      {:erro, changeset} = Create.call(params)

      assert errors_on(changeset) == expected_response
    end
  end
end
