all: compile dialyzer test

###===================================================================
### build
###===================================================================
.PHONY: test_co co compile es escriptize run

co:compile
compile: 
	./rebar3 compile

test_co:
	./rebar3 as test compile

es:escriptize
escriptize: clean
	./rebar3 escriptize

### clean
.PHONY: clean distclean
clean:
	./rebar3 clean

distclean:
	./rebar3 clean -a

###===================================================================
### test
###===================================================================
.PHONY: test eunit ct testclean

test: epmd dialyzer testclean eunit ct
	./rebar3 cover --verbose

eunit: epmd
	./rebar3 eunit

ct: epmd
	./rebar3 ct

testclean:
	@rm -fr _build/test

shell: epmd 
	./rebar3 as test shell

dialyzer: epmd
	./rebar3 do dialyzer

tar: epmd
	rm -rf _build/prod
	./rebar3 as prod escriptize
	./rebar3 as prod release
	./rebar3 as prod tar

pull: epmd
	sh tool.sh pull
###===================================================================
### other
###===================================================================
.PHONY: epmd

epmd:
	@pgrep epmd 2> /dev/null > /dev/null || epmd -daemon || true

