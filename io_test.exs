defmodule IoTest do
  def email(username, domain) do
    # This create a new binary (concatenating)
    # username <> "@" <> domain

    # This don't (IO.data)
    [username, ?@, domain]
  end

  def welcome_message(name, username, domain) do
    # This create a new binary (interpolation)
    # "Welcome #{name}, your email is: #{email(username, domain)}"

    # This don't (IO.data)
    ["Welcome ", name, ", your email is: ", email(username, domain)]
  end

end

IO.puts(IoTest.welcome_message("Mirian", "midge", "marvelousmail.com"))
