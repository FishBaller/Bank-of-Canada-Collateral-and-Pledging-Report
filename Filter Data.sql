create table cust2 as
select
      *,
      case
          when industry = 'Financial' and jurisdiction = 'Canada' then 'Domestic Banks'
          when industry <> 'Financial' and jurisdiction = 'Canada' then 'Other Domestic'    
          else 'Foreign Cpty'
      end as cpty_type
from customer
;


create table sec2 as
select
      *,
      case
          when industry = 'Sovereign' and security_type = 'Bond' then 'Level_1_Asset'
          when industry not in ('Sovereign', 'Financial', 'Insurance') 
            and issuer_credit_rating like 'A%' and issuer_credit_rating <> 'A-' then 'Level_2_Asset'
          else 'Level_3_Asset'                                                                          
      end as asset_class
from sec
;