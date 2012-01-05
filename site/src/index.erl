%% -*- mode: nitrogen -*-
-module (index).
-compile(export_all).
-include_lib("nitrogen_core/include/wf.hrl").

main() -> #template { file="./site/templates/bare.html" }.

title() -> "Nitrogen Sample Application".

body() ->
    [
        #h1 { text="Nitrogen Sample Application" }
    ].
