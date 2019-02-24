module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)

---- TYPE DECLARATIONS ----
type alias TodoItem = 
    { todo : String
    , uid : Int
    , done : Bool
    }

type alias Model =
    { value : Int
    , item : String
    , list : List TodoItem
    , uid : Int
    }

---- MODEL ----
initModel : Model
initModel =  
    { value = 0
    , item = ""
    , list = [{ todo = "This is the first test", uid = 0, done = False }, { todo = "This is the second test", uid = 1, done = False}]
    , uid = 0
    }

---- HELPER FUNCTIONS ----
generateItem : Model -> TodoItem
generateItem model =
    { todo = model.item 
    , uid = model.uid + 1
    , done = False
    }

renderItem : TodoItem -> Html Msg
renderItem item =
    div [] [text item.todo]

renderList : List TodoItem -> Html Msg
renderList list =
    let 
        itemList = List.map renderItem list
    in 
        div [] itemList

---- UPDATE ----
type Msg = Increment 
    | Decrement
    | AddItem
    | UpdateTodoItem String

update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            {model | value = model.value + 1}
    
        Decrement ->
            { model | value = model.value - 1}

        AddItem -> {model | 
            list = generateItem model :: model.list, 
            uid = model.uid,
            item = ""}

        UpdateTodoItem str -> {model | item = str}

---- VIEW ----
view : Model -> Html Msg
view model =
        div[ style "text-align" "center"] 
        [ text "To Do List"
        , div[ style "margin-top" "10px"] 
            [ button[ onClick Decrement, style "margin-right" "10px" ] [ text "-"]
            , text (String.fromInt model.value)
            , button [ onClick Increment, style "margin-left" "10px"] [text "+"]]
        , div [ style "padding-top" "20px"] 
            [input [ placeholder "What do you have to do?"
                    , style "width" "200px"
                    , onInput UpdateTodoItem
                    , value model.item] []
            , div [ style "padding-top" "20px"] 
                [ button [ onClick AddItem ] [text "Add Item"]]]
        , div [ style "margin-top" "10px"] 
            [ text "Your list includes:"
            , text (String.fromInt model.uid)
            , text model.item
            , renderList model.list]
        ]

main = Browser.sandbox
    { init = initModel
    , view = view
    , update = update 
    }