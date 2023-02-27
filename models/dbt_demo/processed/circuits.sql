{{ config(
    materialized='incremental',
    location_root='/mnt/myformula1dlake/processed',
    file_format='delta'
) }}

{% set data_source = 'demo' %}
{% set file_date = var("folder", '') %}

{% set source_path %}
 '/mnt/myformula1dlake/raw/{{file_date}}/'
{% endset %}

select
    circuitId as circuit_id,
    circuitRef as circuit_ref,
    lat as latitude,
    lng as longitude,
    alt as altitude,
    '{{data_source}}' as data_source,
    {{file_date}} as file_date,
    current_timestamp() as ingestion_date
from {{ source('formula1_raw', 'CIRCUITS') }}
