
{{
    config(
        materialized='incremental',
        file_format='delta',
        alias='media_clicks',
        partition_by='year',
        location_root='/mnt/myformula1dlake/processed'
    )
}}

select * from {{ source('bronze_datorama', 'media_clicks') }}