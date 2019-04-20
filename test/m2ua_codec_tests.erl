-module(m2ua_codec_tests).
-author('Harald Welte <laforge@gnumonks.org>').

-include_lib("eunit/include/eunit.hrl").

-include("xua.hrl").
-include("m2ua.hrl").

-define(M2UA_MSG_BIN, <<1,0,6,1,0,0,0,124,0,1,0,8,0,0,0,0,3,0,0,105,131,92,
			 64,0,192,9,0,3,13,24,10,18,7,0,18,4,83,132,9,0,23,
			 11,18,6,0,18,4,68,119,88,16,70,35,67,100,65,73,4,
			 81,1,2,200,107,42,40,40,6,7,0,17,134,5,1,1,1,160,
			 29,97,27,128,2,7,128,161,9,6,7,4,0,0,1,0,1,3,162,
			 3,2,1,0,163,5,161,3,2,1,0,108,13,163,11,2,1,64,2,1,8,48,3,10,1,0,0,0,0>>).
-define(M2UA_MSG_DEC, {xua_msg,1,6,1,[{1,{4,<<0,0,0,0>>}},{768,{101,<<131,92,64,0,192,9,0,3,13,24,10,18,7,0,18,4,83,132,9,0,23,11,18,6,0,18,4,68,119,88,16,70,35,67,100,65,73,4,81,1,2,200,107,42,40,40,6,7,0,17,134,5,1,1,1,160,29,97,27,128,2,7,128,161,9,6,7,4,0,0,1,0,1,3,162,3,2,1,0,163,5,161,3,2,1,0,108,13,163,11,2,1,64,2,1,8,48,3,10,1,0>>}}]}).

parse_test() ->
	?assertEqual(?M2UA_MSG_DEC, ossie_m2ua_codec:parse_m2ua_msg(?M2UA_MSG_BIN)),
	?assertEqual(?M2UA_MSG_DEC, ossie_xua_codec:parse_msg(?M2UA_MSG_BIN)).
encode_test() ->
	?assertEqual(?M2UA_MSG_BIN, ossie_m2ua_codec:encode_m2ua_msg(?M2UA_MSG_DEC)),
	?assertEqual(?M2UA_MSG_BIN, ossie_xua_codec:encode_msg(?M2UA_MSG_DEC)).
