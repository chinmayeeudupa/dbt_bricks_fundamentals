
{{
    config(
        materialized='incremental',
        file_format='delta',
        alias='app_bundles',
        location_root='/mnt/myformula1dlake/processed'
    )
}}

select * from {{ source('bronze_smartfinish', 'app_bundles') }}
