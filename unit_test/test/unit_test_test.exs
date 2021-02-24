defmodule UnitTestTest do
  use ExUnit.Case, async: true # to run tests in parallel

  alias UnitTest.Benefit.Eligibility

  describe "Benefit.Eligibility/1" do
    test "Two months or more after admission should return true" do
      customer_data = %{
        hire_date: ~D[2018-05-30],
        today: Date.utc_today
      }

      assert Eligibility.eligible_by_hiring_date(customer_data)
    end

    test "Less then two months after admission should return false" do
      customer_data = %{
        hire_date: ~D[2021-01-30],
        today: Date.utc_today
      }

      refute Eligibility.eligible_by_hiring_date(customer_data)
    end
  end
end
