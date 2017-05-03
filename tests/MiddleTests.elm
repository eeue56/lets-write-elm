module MiddleTests exposing (..)

import Test exposing (..)
import Fuzz
import Test.Html.Query as Query
import Test.Html.Selector as Selector
import Test.Html.Events as Events
import Expect
import Middle.Main exposing (Msg(..))


defaultModel : Middle.Main.Model
defaultModel =
    { name = "", people = [] }


all : Test
all =
    describe "Middle test suite"
        [ Test.fuzz Fuzz.string
            "Changing a name will actually change a name"
            (\name ->
                Middle.Main.update (ChangeName name) defaultModel
                    |> Expect.equal { name = name, people = [] }
            )
        , Test.fuzz Fuzz.string
            "Typing input will actually trigger an event"
            (\name ->
                Query.fromHtml (Middle.Main.changeNameView "")
                    |> Events.simulate (Events.Input "hello")
                    |> Events.expectEvent (ChangeName "hello")
            )
        , Test.fuzz Fuzz.string
            "Saving a name will actually change a name"
            (\name ->
                Middle.Main.update (SavePerson) { defaultModel | name = name }
                    |> Expect.equal { name = "", people = [ name ] }
            )
        , Test.test
            "Clicking save will actually save the item"
            (\_ ->
                Query.fromHtml (Middle.Main.view defaultModel)
                    |> Events.simulate Events.Click
                    |> Events.expectEvent SavePerson
            )
        , Test.test
            "People view says add a user when no users"
            (\_ ->
                Query.fromHtml (Middle.Main.peopleView defaultModel.people)
                    |> Query.has [ Selector.text "Add a user!" ]
            )
        , Test.test
            "People view has the people's name in when there are people"
            (\_ ->
                Query.fromHtml (Middle.Main.peopleView [ "Noah" ])
                    |> Query.has [ Selector.text "Noah" ]
            )
        ]
