
{{
    config(
        materialized='incremental',
        file_format='delta',
        alias='app_bundles',
        partition_by='year',
        location_root='/mnt/myformula1dlake/processed'
    )
}}

select * from {{ source('bronze_55com', 'silver_app_bundles') }}
