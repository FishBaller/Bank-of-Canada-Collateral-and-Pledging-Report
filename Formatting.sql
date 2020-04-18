create table rep_strusct as
select
      a.cpty_type,
      b.direction,
      c.margin_type
from (select distinct cpty_type from output) a
cross join (select distinct direction from output) b
cross join (select distinct margin_type from output) c
order by a.cpty_type, b.direction, c.margin_type
;


create table col_trans_report as
select
      a.cpty_type,
      a.direction,
      a.margin_type as 'Collateral Type',               
      coalesce(b.level_1_asset, 0) level_1_asset,
      coalesce(b.level_2_asset, 0) level_2_asset,
      coalesce(b.level_3_asset, 0) level_3_asset
from rep_strusct a
left join output b
on a.cpty_type = b.cpty_type
and a.direction = b.direction
and a. margin_type = b.margin_type
;