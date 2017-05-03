module StartTests exposing (..)

import Test exposing (..)
import Fuzz
import Test.Html.Query as Query
import Test.Html.Selector as Selector
import Expect
import Start.Main


all : Test
all =
    describe "My HelloWorld test suite"
        [ Test.test "The view function says Hello world!"
            (\() ->
                Query.fromHtml Start.Main.helloWorldView
                    |> Query.has [ Selector.text "Hello world!" ]
            )
        , Test.test "The view function has 4 elements!"
            (\() ->
                Query.fromHtml Start.Main.listOfFourView
                    |> Query.findAll [ Selector.tag "li" ]
                    |> Query.count (Expect.equal 4)
            )
        , Test.test "The view is welcoming"
            (\() ->
                Query.fromHtml (Start.Main.welcomeView "noah")
                    |> Query.has [ Selector.text "Welcome noah!" ]
            )
        , Test.fuzz Fuzz.string
            "The view is welcoming to everyone!"
            (\name ->
                Query.fromHtml (Start.Main.welcomeView name)
                    |> Query.has [ Selector.text ("Welcome " ++ name ++ "!") ]
            )
        , Test.test "The view is welcoming to long names"
            (\() ->
                Query.fromHtml (Start.Main.welcomeView "Rhydian")
                    |> Query.has [ Selector.text "Welcome Rhydian! That's a long name" ]
            )
        ]
