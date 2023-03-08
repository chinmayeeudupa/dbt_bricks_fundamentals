
{{
    config(
        materialized="incremental",
        file_format="parquet",
        incremental_strategy="insert_overwrite",
        alias="media_clicks",
        partition_by="year",
        location_root="/mnt/myformula1dlake/processed",
    )
}}

with
    source as (
        select *
        from
            {{ source("bronze_datorama", "media_clicks") }}

            {% if is_incremental() %} 
            -- this filter will only be applied on an incremental run
            -- where event_time > (select max(event_time) from {{ this }}) 
            {% endif %}
    )

select 
    *,
    current_timestamp() as ingestion_date
from source
