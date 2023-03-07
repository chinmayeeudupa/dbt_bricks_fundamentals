
{{
    config(
        materialized='incremental',
        file_format='delta',
        alias='gbu_daily_hygiene',
        location_root='/mnt/myformula1dlake/processed'
    )
}}

select * from {{ source('bronze_55com', 'gbu_daily_hygiene') }}
