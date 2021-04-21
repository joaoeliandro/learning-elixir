defmodule ReportJobs.ParserTest do
  use ExUnit.Case

  alias ReportJobs.Parser

  describe "parse_file/1" do
    test "should parse the file" do
      file_name = "gen_report_test.csv"

      response =
        file_name
        |> Parser.parse_file()
        |> Enum.map(& &1)

      expected_response = [
        ["daniele", 7, 29, "abril", 2018],
        ["mayk", 4, 9, "dezembro", 2019],
        ["daniele", 5, 27, "dezembro", 2016],
        ["mayk", 1, 2, "dezembro", 2017],
        ["giuliano", 3, 13, "fevereiro", 2017],
        ["cleiton", 1, 22, "junho", 2020],
        ["giuliano", 6, 18, "fevereiro", 2019],
        ["jakeliny", 8, 18, "julho", 2017],
        ["joseph", 3, 17, "março", 2017],
        ["jakeliny", 6, 23, "março", 2019]
      ]

      assert response == expected_response
    end
  end
end
