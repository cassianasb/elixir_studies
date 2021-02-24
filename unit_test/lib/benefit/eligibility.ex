defmodule UnitTest.Benefit.Eligibility do

  use Timex

  @type customer_data :: %{
    account_id: String.t(),
    hire_date: Date.t(),
    temination_date: boolean,
    today: Date.t()
  }

  @experience_months_interval 2

  @spec eligible_by_hiring_date(customer_data) :: false
  def eligible_by_hiring_date(%{hire_date: hire_date}) when is_nil(hire_date), do: false

  @spec eligible_by_hiring_date(customer_data) :: true | false
  def eligible_by_hiring_date(customer_data) do
    date = customer_data
    difference = Timex.diff(date.today, date.hire_date, :months)

    cond do
      difference >= @experience_months_interval ->
        true

      difference < @experience_months_interval ->
        false
    end
  end
end
