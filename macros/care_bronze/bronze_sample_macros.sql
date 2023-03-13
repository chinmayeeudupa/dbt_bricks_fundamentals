{#
    --dbt build --select result:error+ --defer --state ./target
    --dbt test -s model,test_type:generic
    --spark.sql.legacy.allowCreatingManagedTableUsingNonemptyLocation
        options={
            'allowNonEmptyLocation': 'true'
        }
        options={
            'partitionOverwriteMode': 'DYNAMIC'
        }
#}
