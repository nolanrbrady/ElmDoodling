import Html exposing (..)
import Html.Events exposing (onClick)
import Platform.Cmd

main =
  Html.program
      { init = (0, Cmd.none)
      , update = update
      , view = view
      , subscriptions = \_ -> Sub.none
      }

type Msg = Increment | Decrement

type alias Model = Int

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Increment ->
      ( model + 1 ) ! []

    Decrement ->
      ( model - 1 ) ! []

view model =
  div []
    [ div [] [text "Basically Hacker News!"]
    , button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (toString model) ]
    , button [ onClick Increment ] [ text "+" ]
    ]
