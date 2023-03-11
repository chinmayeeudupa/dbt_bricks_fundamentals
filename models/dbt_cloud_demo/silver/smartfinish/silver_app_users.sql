
{{
    config(
        materialized='incremental',
        incremental_strategy='merge',
        unique_key=['constructorId'],
        alias='app_users'
    )
}}

select * from {{ source('bronze_smartfinish', 'app_users') }}
