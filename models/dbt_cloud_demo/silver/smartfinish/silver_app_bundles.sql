
{{
    config(
        materialized='incremental',
        incremental_strategy='merge',
        unique_key=['constructorId'],
        alias='app_bundles'
    )
}}

select * from {{ source('bronze_smartfinish', 'app_bundles') }}
