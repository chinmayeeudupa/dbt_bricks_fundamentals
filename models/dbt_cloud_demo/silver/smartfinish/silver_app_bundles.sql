
{{
    config(
        materialized='incremental',
        file_format='delta',
        incremental_strategy='merge',
        unique_key=['constructorId'],
        alias='app_bundles',
        location_root='/mnt/myformula1dlake/processed'
    )
}}

select * from {{ source('bronze_smartfinish', 'app_bundles') }}
