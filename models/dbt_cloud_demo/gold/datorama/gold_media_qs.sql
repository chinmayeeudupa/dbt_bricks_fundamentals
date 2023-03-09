
{{
    config(
        materialized='incremental',
        file_format='delta',
        unique_key=['raceId', 'year'],
        alias='media_qs',
        partition_by='year',
        location_root='/mnt/myformula1dlake/presentation'
    )
}}

select * from {{ ref('silver_media_qs') }}
