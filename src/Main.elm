module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)

-- Importing the Screens
import NavBar as NavigationBar
import TodoList as TodoList
import HackerNews as HackerNews

---- MODEL ----

type alias Model =
    { item : String
    -- , page : Html Msg
    , list : List String }

initModel : Model 
initModel = {
    item = "",
    -- page = HackerNews,
    list = [] }


init : ( Model, Cmd Msg )
init =
    ( initModel, Cmd.none )



---- UPDATE ----
type Msg
    = NoOp
    | SubmitItem
    -- | HackerNews
    -- | TodoList

update : Msg -> Model -> Model
update msg model =
    case msg of
        SubmitItem -> { model | item = model.item }

        NoOp -> { model | item = "", list = [] }

        -- HackerNews -> { model | page = HackerNews.main }

        -- TodoList -> { model | page = TodoList.main }



---- VIEW ----
view : Model -> Html Msg
view model =
    div [ style "width" "100%"
        , style "text-align" "center"
        , style "margin" "0px"
        , style "padding" "0px"]
        [ div [ style "padding" "0px"
             , style "margin" "0px"
             , style "display" "flex"
             , style "flex-direction" "row"
             , style "height" " 45px"]
        [ div [ style "font-weight" "600"
              , style "padding-right" "5em"
          ]
          [ text "Elm Bike Shedding" ]
          , div [ style"padding-right" "2.5em"] [ a [href "./Todolist.elm"] [ text "Todo List" ]]
          , div [] [ a [ href "./HackerNews.elm" ] [ text "Hacker News" ]]
        ]
        , img [ src "../public/logo.svg", style "height" " 150px", style "width" "150px" ] []
        , div [ style "justify-content" "center"
              , style "align-items" "center" ]
              [ h1 [ style "color" "red"] [ text "The Elm Bike Shedding Project" ]
              , p [] [ text "This is another test"]
              , div [ style "width" "100%"
                    , style "text-align" "center"
                    ]
                    [ text "This is another div just for shits"]]
              ]




---- PROGRAM ----
main =
    Browser.sandbox
        { view = view
        , init = initModel
        , update = update
        -- , subscriptions = always Sub.none
        }
