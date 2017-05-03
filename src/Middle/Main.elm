module Middle.Main exposing (..)

import Html
import Html.Attributes
import Html.Events
import Start.Main exposing (welcomeView)


type alias Model =
    { name : String
    , people : List String
    }


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


view : Model -> Html.Html Msg
view model =
    Html.div
        []
        [ changeNameView model.name
        , welcomeView model.name
        , saveUserView
        ]


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = { name = "", people = [] }
        , view = view
        , update = update
        }
