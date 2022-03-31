select st.station_id, last_reported
from {{ ref('citibike_static_flatten') }} as st
left join citibike_anton.raw_base.citibike_live_flatten as li 
on st.station_id = li.station_id