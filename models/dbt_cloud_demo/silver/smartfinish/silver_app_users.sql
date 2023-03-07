
{{
    config(
        materialized='incremental',
        file_format='delta',
        alias='app_users',
        location_root='/mnt/myformula1dlake/processed'
    )
}}

select * from {{ source('bronze_55com', 'silver_app_users') }}
