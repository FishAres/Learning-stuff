import Browser
import Html exposing (..)
import Html.Events exposing (..)
import Random

main =
  Browser.element
    { init = init
    , update = update
    , subscriptions = subscriptions
    , view = view
    }

type alias Model = 
    { dieFace : Int
    }

init : () -> (Model, Cmd Msg)
init _ =
    ( Model 1
    , Cmd.none
    )

type Msg
    = Roll
    | NewFace Int

update : Msg -> Model -> (Model, Cmd Msg)
update msg model = 
    case msg of 
        Roll ->
            ( model 
            , Random.generate NewFace (Random.int 2 12)
            )

        NewFace newFace ->
            ( Model newFace 
            , Cmd.none
            )

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text (String.fromInt model.dieFace) ]
        , button [ onClick Roll ] [ text "Fajood?" ]
        ]