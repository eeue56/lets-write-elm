port module Main exposing (..)

import Test
import Test.Runner.Node exposing (run, TestProgram)
import Json.Encode exposing (Value)
import StartTests
import MiddleTests


main : TestProgram
main =
    [ StartTests.all
    , MiddleTests.all
    ]
        |> Test.describe "Our tests"
        |> run emit


port emit : ( String, Value ) -> Cmd msg
