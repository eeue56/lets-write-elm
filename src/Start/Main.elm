module Start.Main exposing (..)

import Html


{-| Takes a name and returns "welcome {name}!"
    If the name is long, it also says "That's a long name!"
-}
makeWelcomeMessage : String -> String
makeWelcomeMessage name =
    name ++ "!"


{-| Returns true if the name is long
-}
isALongName : String -> Bool
isALongName name =
    False



-- VIEWS


{-| I should say "Hello world!"
-}
helloWorldView : Html.Html msg
helloWorldView =
    Html.text ""


{-| There should be four items in this list

-}
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
