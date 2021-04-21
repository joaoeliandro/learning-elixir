defmodule ReportJobs do
  alias ReportJobs.Parser

  @names [
    "daniele",
    "mayk",
    "giuliano",
    "cleiton",
    "jakeliny",
    "joseph",
    "diego",
    "rafael",
    "vinicius",
    "danilo"
  ]

  @months [
    "janeiro",
    "fevereiro",
    "março",
    "abril",
    "maio",
    "junho",
    "julho",
    "agosto",
    "setembro",
    "outubro",
    "novembro",
    "dezembro"
  ]

  def build(filename) do
    filename
    |> Parser.parse_file()
    |> Enum.reduce(hours_acc(), fn line, acc ->
      get_hours(line, acc)
    end)
  end

  defp hours_acc do
    month_list = Enum.into(@months, %{}, &{&1, 0})
    year_list = Enum.into(2016..2020, %{}, &{&1, 0})

    %{"all_hours" => %{}, "hours_per_month" => %{}, "hours_per_year" => %{}}
    |> Map.put("all_hours", acc_name_map_gen(0))
    |> Map.put("hours_per_month", acc_name_map_gen(month_list))
    |> Map.put("hours_per_year", acc_name_map_gen(year_list))
  end

  defp get_hours([name, hours, _day, month, year], %{
         "all_hours" => all_hours,
         "hours_per_month" => hours_per_month,
         "hours_per_year" => hours_per_year
       }) do
    all_hours = Map.put(all_hours, name, all_hours[name] + hours)
    hours_per_month = sum_values(hours_per_month, name, month, hours)
    hours_per_year = sum_values(hours_per_year, name, year, hours)

    %{
      "all_hours" => all_hours,
      "hours_per_month" => hours_per_month,
      "hours_per_year" => hours_per_year
    }
  end

  defp sum_values(map, name, date, hours) do
    Map.put(
      map,
      name,
      Map.put(map[name], date, map[name][date] + hours)
    )
  end

  defp acc_name_map_gen(value), do: Enum.into(@names, %{}, &{&1, value})
end
