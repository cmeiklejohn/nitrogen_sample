%% -*- mode: nitrogen -*-
-module (index).
-compile(export_all).
-include_lib("nitrogen_core/include/wf.hrl").

main() -> #template { file="./site/templates/bare.html" }.

title() -> "Chat".

body() -> wf:comet_global(fun() -> repeater() end, repeater_pool),
          [
            #panel { class="twelve columns offset-by-one content", body = [
              #h1 { text="Chat" },
              #label { text="Your message:" },
              #textbox { id=msg, text="", next=submit },
              #button { id=submit, text="Say", postback=submit },
              #panel { id=placeholder }
            ]}
          ].

event(submit) ->
  wf:send_global(repeater_pool, {msg, wf:q(msg)}).

repeater() ->
  receive 
    {msg, Msg} -> wf:insert_top(placeholder, [Msg, "<br>"])
  end,
  wf:flush(),
  repeater().
