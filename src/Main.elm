module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)


---- MODEL ----


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ img [ src "../public/logo.svg" ] []
        , h1 [ style "color" "red"] [ text "Attempting a To Do list!" ]
        , p [] [ text "This is another test"]
        , input [ style "width" "200px", style "border-radius" "15px"] []
        , button [] [text "Submit Item"]
        , div [] [ text "This is a test"
        , div [ style "color" "blue"] [ text "Another One" ]]
        ]




---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
