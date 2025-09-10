



select
    *
from `prod`.`warehouse`.`stg_airride__trips`

where not(started_at < ended_at)

