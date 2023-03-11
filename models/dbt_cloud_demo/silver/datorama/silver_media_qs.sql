
{{
    config(
        materialized='incremental',
        incremental_strategy='merge',
        unique_key=['raceId', 'year'],
        alias='media_qs'
        
    )
}}
--partition_by='year'
select * from {{ source('bronze_datorama', 'media_qs') }}
