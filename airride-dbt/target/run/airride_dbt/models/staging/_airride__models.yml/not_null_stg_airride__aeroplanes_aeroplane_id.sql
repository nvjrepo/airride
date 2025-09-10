
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from `prod`.`dbt_test__audit`.`not_null_stg_airride__aeroplanes_aeroplane_id`
    
      
    ) dbt_internal_test