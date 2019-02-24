module NavBar exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
-- import Html.Styled.Attributes exposing (css)
import Css exposing (..)

main = 
    div[ style "padding" "0px"
        , style "margin" "0px 0px 10px 0px"
        , style "background-color" "red"
        , style "height" " 45px"] 
        [text "This is the navigation div", text "Another one"]
