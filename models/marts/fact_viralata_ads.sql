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
        left join outbound_clicks as click on
            click.ad_id = info_geral.ad_id
            and click.date = info_geral.date
        left join video_30 as video on
            video.ad_id = info_geral.ad_id
            and video.date = info_geral.date
    )

    , renamed as (
        select 
            date
            , account_id
            , ad_id
            , campaign_name
            , adset_name
            , ad_name
            , spend
            , reach
            , impressions
            , clicks
            , inline_link_clicks as link_click
            , inline_post_engagement as post_engagement
            , outbound_click
            , video_view
        from joining
    )

select *
from renamed