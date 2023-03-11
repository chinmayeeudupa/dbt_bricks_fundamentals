
{{
    config(
        materialized='incremental',
        alias='app_users',
        unique_key=['constructorId']
    )
}}

select * from {{ ref('silver_app_users') }}
