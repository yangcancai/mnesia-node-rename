mrename
=====

An OTP application

Build
-----

    $ rebar3 escriptize

How to use ?
-----
     help:
    ```erlang
	$ _build/default/bin/mrename view
	./mrename rename SchemaFile OldNodeName NewNodeName -- change nodename
	./mrename view SchemaFile -- view nodename
    ```
