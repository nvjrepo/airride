
    select
      sum(coalesce(diff_count, 0)) as failures,
      sum(coalesce(diff_count, 0)) != 0 as should_warn,
      sum(coalesce(diff_count, 0)) != 0 as should_error
    from (
      
        select *
        from `prod`.`dbt_test__audit`.`dbt_utils_equal_rowcount_dim_a_cd8fb537321b6a6a0d5c04fd7edee045`
    
      
    ) dbt_internal_test