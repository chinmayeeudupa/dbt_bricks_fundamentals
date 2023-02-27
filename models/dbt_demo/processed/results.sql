{{ config(
    materialized='incremental',
    location_root='/mnt/myformula1dlake/processed',
    partition_by='raceId',
    unique_key=['resultId', 'raceId'],
    file_format='delta'
) }}

{% set data_source = 'demo' %}
{% set file_date = var("folder", '') %}

select
    *,
    '{{data_source}}' as data_source,
    {{file_date}} as file_date,
    current_timestamp() as ingestion_date
from {{ source('formula1_raw', 'RESULTS') }}
