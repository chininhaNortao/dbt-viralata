with
    source as (
        select *
        from {{ source("viralata_ads", "info_geral_video_30_sec_watched_actions") }}
    )
    
    , renamed as (
        select
            -- _fivetran_id
            -- , _fivetran_synced
            date
            , ad_id
            , index
            , action_type
            -- , inline
            , value
        from source
    )

select *
from renamed
