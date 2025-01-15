-module(sumo_test_people_pgsql).

-behavior(sumo_doc).

%% @todo remove this once mixer migrates specs better
-dialyzer([no_behaviours]).

-include_lib("mixer/include/mixer.hrl").
-mixin([
  {sumo_test_people, [
    sumo_wakeup/1,
    sumo_sleep/1,
    new/2,
    new/3,
    new/4,
    name/1,
    last_name/1,
    id/1,
    from_map/1,
    age/1,
    address/1,
    birthdate/1,
    created_at/1,
    height/1,
    description/1,
    profile_image/1,
    is_blocked/1,
    status/1,
    weird_field1/1,
    weird_field2/1,
    weird_field3/1,
    bignit_field/1,
    json_field/1
  ]}
]).

-export([sumo_schema/0]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% sumo_doc callbacks
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-spec sumo_schema() -> sumo:schema().
sumo_schema() ->
  Fields =
    [sumo:new_field(id,            integer, [id, not_null, auto_increment]),
     sumo:new_field(name,          string,  [{length, 255}, not_null, unique]),
     sumo:new_field(last_name,     string,  [{length, 255}, not_null]),
     sumo:new_field(age,           integer),
     sumo:new_field(address,       string,  [{length, 255}]),
     sumo:new_field(birthdate,     date),
     sumo:new_field(created_at,    datetime),
     sumo:new_field(height,        float),
     sumo:new_field(description,   custom,  [{type, text}]),
     sumo:new_field(profile_image, binary),
     sumo:new_field(is_blocked,    boolean),
     sumo:new_field(status,        string),
     sumo:new_field(weird_field1,  custom, [{type, term}]),
     sumo:new_field(weird_field2,  custom, [{type, list}]),
     sumo:new_field(weird_field3,  custom, [{type, map}]),
     sumo:new_field(bignit_field,  bigint),
     sumo:new_field(json_field,    json),
     sumo:new_field(missing,       boolean)
    ],
  sumo:new_schema(people, Fields).
