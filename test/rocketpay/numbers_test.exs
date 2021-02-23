defmodule Rocketpay.NumbersTest do
 use ExUnit.Case

 alias Rocketpay.Numbers

 describe "sum_from_file/1" do
   test "When there is a file with the given name, returns the sum of numbers" do
     response =  Numbers.sum_from_file("numbers")

     expected = {:ok, %{result: 37}}

     assert  response == expected
   end

   test "When there is no file with the given name, returns an error" do
    response =  Numbers.sum_from_file("letters")

    expected = {:error, %{message: "Error"}}

    assert  response == expected
  end
 end

end
