
{{
    config(
        materialized='incremental',
        file_format='delta',
        incremental_strategy='merge',
        unique_key=['circuitId'],
        alias='gbu_daily_hygiene',
        location_root='/mnt/myformula1dlake/processed'
    )
}}

select * from {{ source('bronze_55com', 'gbu_daily_hygiene') }}
