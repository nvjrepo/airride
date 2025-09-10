
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from `prod`.`dbt_test__audit`.`dbt_utils_expression_is_true_s_9cb22facfe84751d6cef46229a72c7d0`
    
      
    ) dbt_internal_test