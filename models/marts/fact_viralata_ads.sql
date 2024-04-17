with
    info_geral as (
        select *
        from {{ ref('stg_viralata_ads__info_geral') }}
    )

    , outbound_clicks as (
        select *
        from {{ ref('stg_viralata_ads__info_geral_outbound_clicks') }}
    )

    , video_30 as (
        select *
        from {{ ref('stg_viralata_ads__info_geral_video_30_sec_watched_actions') }}
    )

    , joining as (
        select 
            info_geral.*
            , click.value as outbound_click
            , video.value as video_view
        from info_geral
        inner join outbound_clicks as click on
            click.ad_id = info_geral.ad_id
            and click.date = info_geral.date
        inner join video_30 as video on
            video.ad_id = info_geral.ad_id
            and video.date = info_geral.date
    )

select *
from joining