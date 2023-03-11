
{{
    config(
        materialized='incremental',
        unique_key=['circuitId'],
        alias='gbu_daily_hygiene'
    )
}}

select * from {{ ref('silver_gbu_daily_hygiene') }}
