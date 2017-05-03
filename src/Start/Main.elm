module Start.Main exposing (..)

import Html


{-| Takes a name and returns "welcome {name}!"
-}
makeWelcomeMessage : String -> String
makeWelcomeMessage name =
    name ++ "!"


sayHiToEveryone : List String -> List String
sayHiToEveryone people =
    List.map makeWelcomeMessage people



-- VIEWS


helloWorldView : Html.Html msg
helloWorldView =
    Html.text ""


listOfFourView : Html.Html msg
listOfFourView =
    Html.ul
        []
        [ Html.li [] [ Html.text "First" ]
        , Html.li [] [ Html.text "Second" ]
        ]


welcomeView : String -> Html.Html msg
welcomeView name =
    Html.div
        []
        [ Html.text (makeWelcomeMessage name) ]



-- main


main : Html.Html msg
main =
    Html.div
        []
        [ helloWorldView
        , listOfFourView
        , welcomeView "noah"
        ]
