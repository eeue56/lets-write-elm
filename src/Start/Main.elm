module Start.Main exposing (..)

import Html


{-| Takes a name and returns "Welcome {name}!"
    If the name is long, it also says "That's a long name"
-}
makeWelcomeMessage : String -> String
makeWelcomeMessage name =
    -- When short, just say "Welcome {name}!"
    -- Otherwise, just say "Welcome {name}! That's a long name"
    if isALongName name then
        "Welcome " ++ name ++ "! That's a long name"
    else
        "Welcome " ++ name ++ "!"


{-| Returns true if the name is long
-}
isALongName : String -> Bool
isALongName name =
    String.length name > 6



-- VIEWS


{-| I should say "Hello world!"
-}
helloWorldView : Html.Html msg
helloWorldView =
    Html.text "Hello world!"


{-| There should be four items in this list

-}
listOfFourView : Html.Html msg
listOfFourView =
    Html.ul
        []
        [ Html.li [] [ Html.text "First" ]
        , Html.li [] [ Html.text "Second" ]
        , Html.li [] [ Html.text "First" ]
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
