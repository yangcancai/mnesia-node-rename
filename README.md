mrename
=====

An OTP application

Erlang Version
-----
    $ rebar 3.18.0 on Erlang/OTP 24 Erts 12.2.1

Build
-----

    $ rebar3 escriptize

How to use ?
-----
     local env help:
    ```erlang
	$ _build/default/bin/mrename view
	./mrename rename SchemaFile OldNodeName NewNodeName -- change nodename
	./mrename view SchemaFile -- view nodename
    ```
    remote  env help: 
    ```shell
        $ ./rebar3 as prod tar
        $ croc send _build/prod/rel/mrename/mrename-0.1.0.tar.gz
        $ bin/mrename escript bin/mr view SchemaFile
    ```


