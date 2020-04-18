create table cust_join as
select
      a.*,
      b.cpty_type
from col_trans a
left join cust2 b
on a.customer_id = b.customer_id
where a.product_type = 'Security'
;


create table sec_join as
select
      a.*,
      coalesce(b.asset_class, c.asset_class) asset_class     
from cust_join a
left join sec2 b
on a.security_id = b.security_id                             
left join sec2 c
on a.security_id = c.security_id_2
;
