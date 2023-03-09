{% test check_dropped_recs(model) %}

select * from {{model}}
where is_processed is false

{% endtest %}
