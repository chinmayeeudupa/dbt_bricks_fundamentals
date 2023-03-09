{% test check_dropped_recs(model) %}

select count(*) from {{model}}
where is_processed = False

{% endtest %}
