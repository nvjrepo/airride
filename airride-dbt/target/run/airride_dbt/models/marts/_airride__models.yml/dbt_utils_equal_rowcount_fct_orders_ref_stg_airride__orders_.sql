
    select
      sum(coalesce(diff_count, 0)) as failures,
      sum(coalesce(diff_count, 0)) != 0 as should_warn,
      sum(coalesce(diff_count, 0)) != 0 as should_error
    from (
      
        select *
        from `prod`.`dbt_test__audit`.`dbt_utils_equal_rowcount_fct_orders_ref_stg_airride__orders_`
    
      
    ) dbt_internal_test