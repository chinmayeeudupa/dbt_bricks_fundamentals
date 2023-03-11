
{{
    config(
        materialized='incremental',
        unique_key=['raceId', 'year'],
        alias='media_qs'
    )
}}

select * from {{ ref('silver_media_qs') }}
