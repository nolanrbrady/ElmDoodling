module NavBar exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
-- import Html.Styled.Attributes exposing (css)
import Css exposing (..)

main = 
    div[ style "padding" "0px"
        , style "margin" "0px"
        , style "display" "flex"
        , style "flex-direction" "row"
        , style "height" " 45px"] 
        [ div
          [ style "font-weight" "600"
          , style "padding-right" "5em"
          ] [ text "Elm Bike Shedding" ]
        , div [ style"padding-right" "2.5em"] [ a [href "./Todolist.elm"] [ text "Todo List" ]]
        , div [] [ a [ href "./HackerNews.elm" ] [ text "Hacker News" ]]
        ]
