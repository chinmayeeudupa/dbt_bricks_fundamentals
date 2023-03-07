
{{
    config(
        materialized='incremental',
        file_format='delta',
        alias='app_bundles',
        location_root='/mnt/myformula1dlake/presentation'
    )
}}

select * from {{ ref('silver_app_bundles') }}
--dbt build --select result:error+ --defer --state ./target
