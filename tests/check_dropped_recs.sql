{% test check_dropped_recs(src_model) %}

select count(*) from {{src_model}}
where is_processed = False

{% endtest %}
