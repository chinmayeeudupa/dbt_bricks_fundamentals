
{{
    config(
        materialized='incremental',
        alias='app_bundles',
        unique_key=['constructorId']
    )
}}

select * from {{ ref('silver_app_bundles') }}

