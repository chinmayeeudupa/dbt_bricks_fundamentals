
{{
    config(
        materialized='incremental',
        file_format='delta',
        alias='gbu_daily_hygiene',
        location_root='/mnt/myformula1dlake/presentation'
    )
}}

select * from {{ ref('silver_gbu_daily_hygiene') }}
