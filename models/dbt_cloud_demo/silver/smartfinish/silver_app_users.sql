
{{
    config(
        materialized='incremental',
        file_format='delta',
        alias='app_users',
        location_root='/mnt/myformula1dlake/processed'
    )
}}

select * from {{ source('bronze_smartfinish', 'app_users') }}
