module Middle.Main exposing (..)

import Html
import Html.Attributes
import Html.Events
import Start.Main exposing (welcomeView)


-- MODEL


type alias Model =
    { name : String, people : List String }


defaultModel : Model
defaultModel =
    { name = "noah"
    , people = [ "Fred", "Fido" ]
    }



-- UPDATE


type Msg
    = ChangeName String
    | SavePerson


update : Msg -> Model -> Model
update msg model =
    case msg of
        -- IMPLEMENT ME!
        ChangeName newName ->
            { model | name = newName }

        -- IMPLEMENT ME!
        SavePerson ->
            { model | name = "", people = model.name :: model.people }



-- VIEWS


changeNameView : String -> Html.Html Msg
changeNameView name =
    Html.input
        [ Html.Events.onInput ChangeName
        , Html.Attributes.value name
        ]
        []


saveUserView : Html.Html Msg
saveUserView =
    Html.button
        [ Html.Events.onClick (ChangeName "hello")
        ]
        [ Html.text "Save person!" ]


peopleView : List String -> Html.Html Msg
peopleView people =
    if List.length people == 0 then
        Html.text "Add a user!"
    else
        List.map (\person -> Html.li [] [ Html.text person ]) people
            |> Html.ul []


view : Model -> Html.Html Msg
view model =
    Html.div
        []
        [ changeNameView model.name
        , welcomeView model.name
        , saveUserView
        , peopleView model.people
        ]



-- Main


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = { name = "", people = [] }
        , view = view
        , update = update
        }
