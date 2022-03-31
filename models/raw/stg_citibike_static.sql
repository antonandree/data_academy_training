{{
    config(
        materialized='view',
        schema='base'
    )
}}

select
    f.value:station_type::string as station_type,
    f.value:electric_bike_surcharge_waiver::boolean electric_bike_surcharge_waiver,
    f.value:legacy_id::string as legacy_id,
    f.value:lat::float as lat,
    f.value:station_id::string as station_id,
    f.value:capacity::int as capacity,
    f.value:region_id::string as region_id,
    f.value:external_id::string as external_id,
    f.value:short_name::string as short_name,
    f.value:has_kiosk::boolean as has_kiosk,
    f.value:lon::float as lon,
    f.value:eightd_has_key_dispenser::boolean as eightd_has_key_dispenser,
    f.value:name::string as name
from {{ source('citi_bike', 'landing_table_2') }}, table(flatten(v:data:stations)) f