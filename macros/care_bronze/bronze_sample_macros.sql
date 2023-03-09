{#
    --dbt build --select result:error+ --defer --state ./target
    --dbt test -s model,test_type:generic
        options={
            'allowNonEmptyLocation': 'true'
        }
#}
