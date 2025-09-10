
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from `prod`.`dbt_test__audit`.`source_unique_airride_aeroplane_model_id`
    
      
    ) dbt_internal_test