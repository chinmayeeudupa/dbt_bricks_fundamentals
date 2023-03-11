
{{
    config(
        materialized='incremental',
        unique_key=['raceId', 'year'],
        alias='social_actions'
    )
}}

select * from {{ ref('silver_social_actions') }}
