module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)


---- MODEL ----


type alias Model = {
    item : String,
    list : List String }

initModel : Model 
initModel = {
    item = "",
    list = [] }


init : ( Model, Cmd Msg )
init =
    ( initModel, Cmd.none )



---- UPDATE ----
type Msg
    = NoOp
    | SubmitItem

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----
view : Model -> Html Msg
view model =
    div []
        [ img [ src "../public/logo.svg" ] []
        , div [style "justify-content" "center", style "align-items" "center"] 
                [ h1 [ style "color" "red"] [ text "Attempting a To Do list!" ]
            , p [] [ text "This is another test"]
            , input [ style "width" "200px"
                    , style "border-radius" "15px"
                    , value model.item
                    , placeholder "List your item"] []
            , div [ style "padding-top" "20px"] [ button [onClick SubmitItem] [text "Submit Item"]]
            , div [] [ text "This is a test"
            , div [ style "color" "blue"] [ text "Another One" ]
            , div [ style "width" "100%", style "text-align" "center"] [ text "This is another div just for shits"]]
            ]
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
