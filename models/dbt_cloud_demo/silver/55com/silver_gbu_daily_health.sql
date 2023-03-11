
{{
    config(
        materialized='incremental',
        file_format='delta',
        incremental_strategy='merge',
        unique_key=['circuitId'],
        alias='gbu_daily_health'
    )
}}

with cte_src as (
    select * from {{ source('bronze_55com', 'gbu_daily_health') }}

    {% if is_incremental() %}
        -- this filter will only be applied on an incremental run
        -- where ingestion_date > (select max(ingestion_date) from {{ this }}) 
    {% endif %}
)

select *,
    current_timestamp() as ingestion_date,
    false::boolean as is_processed
from cte_src
