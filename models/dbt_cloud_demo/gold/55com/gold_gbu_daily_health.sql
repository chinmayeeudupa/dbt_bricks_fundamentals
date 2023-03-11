
{{
    config(
        materialized='incremental',
        unique_key=['circuitId'],
        alias='gbu_daily_health',
    )
}}

with final as (
    select 
    circuitId, 
    circuitRef,
    name,
    location,
    country,
    lat,
    lng,
    alt,
    url,
    current_timestamp() as ingestion_date from {{ ref('silver_gbu_daily_health') }}

    {% if is_incremental() %}
        -- this filter will only be applied on an incremental run
        where ingestion_date > (select max(ingestion_date) from {{ this }}) 
    {% endif %}
)

select * from final
