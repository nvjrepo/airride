
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from `prod`.`dbt_test__audit`.`relationship_hashed_aeroplane_id__aeroplanes_aeroplane_models`
    
      
    ) dbt_internal_test