
{{
    config(
        materialized='incremental',
        unique_key=['raceId', 'year'],
        alias='media_clicks'
    )
}}

select * from {{ ref('silver_media_clicks') }}
