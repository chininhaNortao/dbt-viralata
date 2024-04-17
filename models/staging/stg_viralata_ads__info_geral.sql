with 
    source as (
        select *
        from {{ source('viralata_ads', 'info_geral') }}
    )

    , renamed as (
        select
            -- _fivetran_id
            -- , _fivetran_synced
            date
            , account_id
            , adset_name
            , campaign_name
            , ad_id
            , ad_name
            , spend
            , reach
            , impressions
            , clicks
            , inline_link_clicks
            , inline_post_engagement
        from source
    )

select * from renamed
