
{{
    config(
        materialized='incremental',
        file_format='parquet',
        incremental_strategy='insert_overwrite',
        alias='media_clicks',
        partition_by='year',
        location_root='/mnt/myformula1dlake/processed'
    )
}}

select * from {{ source('bronze_datorama', 'media_clicks') }}
