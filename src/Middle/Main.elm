module Middle.Main exposing (..)

import Html
import Html.Attributes
import Html.Events
import Start.Main exposing (welcomeView)


-- MODEL


type alias Model =
    { name : String
    , people : List String
    }



-- UPDATE


type Msg
    = ChangeName String
    | SavePerson


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangeName newName ->
            { model | name = newName }

        -- IMPLEMENT ME!
        SavePerson ->
            model



-- VIEWS


changeNameView : String -> Html.Html Msg
changeNameView model =
    Html.input
        [ Html.Events.onInput ChangeName
        , Html.Attributes.defaultValue model
        ]
        []


saveUserView : Html.Html Msg
saveUserView =
    Html.text "Implement me!"


peopleView : List String -> Html.Html Msg
peopleView people =
    Html.text "Implement me"


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
