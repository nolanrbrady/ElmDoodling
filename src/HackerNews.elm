module HackerNews exposing (..)

import Browser
import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)

----- TYPE DECLARATIONS ----

type alias Model = Int


---- MODEL ----

initModel : Int
initModel = 0


----- UPDATE -----

type Msg = Increment | Decrement

update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment -> model + 1

        Decrement -> model - 1


----- VIEW -----
view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Increment ] [ text "+" ]
        , text (String.fromInt model)
        , button [ onClick Decrement ] [ text "-" ]
        ]


----- PROGRAM ----
main = Browser.sandbox
    { init = initModel
    , view = view
    , update = update
    }

