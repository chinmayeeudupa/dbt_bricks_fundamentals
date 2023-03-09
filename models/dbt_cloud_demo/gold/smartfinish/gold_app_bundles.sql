
{{
    config(
        materialized='incremental',
        file_format='delta',
        alias='app_bundles',
        unique_key=['constructorId'],
        location_root='/mnt/myformula1dlake/presentation'
    )
}}

select * from {{ ref('silver_app_bundles') }}

