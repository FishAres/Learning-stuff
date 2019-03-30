{- Elm programs break up into three parts:
 - Model (application state)
 - Update (state update)
 - View (viewing state as HTML) 
-}

-- This is a program for a counter with two buttons

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

main = 
    Browser.sandbox { init = init, update = update, view=view}


-- Model --

type alias Model = Int 
-- Looks like white space matters
init : Model
init = 
    0

-- Update -- 

type Msg = Increment | Decrement | Reset
-- messages from the UI

update : Msg -> Model -> Model  
update msg model = 
    case msg of 
        Increment ->
            model + 1
        
        Decrement -> 
            model - 1

        Reset ->
            0

-- View -- 
view : Model -> Html Msg 
{- This is madness. You can use Elm 
    functions as HTML5 
-}

view model = 
    div []
    [ button [ onClick Decrement] [text "oh no!"]  -- button for decrement
    , div [] [ text (String.fromInt model)], -- output
     button [ onClick Increment] [text "mmmm!"], -- button below
    div [] [],
    button [ onClick Reset] [text "he run away!"]
     ]
     