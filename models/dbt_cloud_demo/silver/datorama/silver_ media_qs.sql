
{{
    config(
        materialized='incremental',
        file_format='delta',
        alias='media_qs',
        partition_by='year',
        location_root='/mnt/myformula1dlake/processed'
    )
}}

select * from {{ source('bronze_55com', 'silver_media_qs') }}
