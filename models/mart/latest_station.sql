SELECT st.station_id,
    st.lat as latitud,
    st.lon as longitud,
    st.name as address_name,
    li.last_reported,
    li.num_docks_available,
    li.station_status,
    li.legacy_id,
    li.num_ebikes_available,
    li.station_id,
    li.num_bikes_available,
    li.is_installed,
    li.is_returning,
    li.num_docks_disabled,
    li.last_reported,
    li.is_renting
FROM {{ ref('citibike_static_flatten') }} AS st
LEFT JOIN citibike_anton.raw_base.citibike_live_flatten AS li 
ON st.station_id = li.station_id
qualify row_number() over (partition by st.station_id ORDER BY li.last_reported DESC) = 1;