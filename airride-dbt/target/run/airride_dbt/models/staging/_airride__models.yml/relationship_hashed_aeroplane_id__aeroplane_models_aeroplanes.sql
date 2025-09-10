
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from `prod`.`default_dbt_test__audit`.`relationship_hashed_aeroplane_id__aeroplane_models_aeroplanes`
    
      
    ) dbt_internal_test