{{
    config(
        materialized='table',
        schema='base'
    )
}}

select
    f.value:num_bikes_disabled::int as num_bikes_disabled,
    f.value:num_docks_available::int as num_docks_available,
    f.value:station_status::string as station_status,
    f.value:legacy_id::string as legacy_id,
    f.value:num_ebikes_available::int as num_ebikes_available,
    f.value:station_id::string as station_id,
    f.value:num_bikes_available::int as num_bikes_available,
    f.value:is_installed::int as is_installed,
    f.value:is_returning::int as is_returning,
    f.value:num_docks_disabled::int num_docks_disabled,
    f.value:last_reported::int last_reported,
    f.value:is_renting::int as is_renting
from {{ source('citi_bike', 'landing_table') }}, table(flatten(v:data:stations)) f