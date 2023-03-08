
{{
    config(
        materialized='incremental',
        file_format='parquet',
        incremental_strategy='insert_overwrite',
        alias='app_bundles',
        location_root='/mnt/myformula1dlake/processed'
    )
}}

select * from {{ source('bronze_smartfinish', 'app_bundles') }}
