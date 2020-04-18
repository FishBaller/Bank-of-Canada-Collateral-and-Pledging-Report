create table output as
select
      cpty_type,
      case
          when post_direction = 'Deliv to Bank' then 'Collateral Received'
          else 'Collateral Pledged'
      end as direction,
      margin_type,
      sum(case when asset_class = 'Level_1_Asset' then pv_cde else 0 end) level_1_asset,                         
      sum(case when asset_class = 'Level_2_Asset' then pv_cde else 0 end) level_2_asset,                         
      sum(case when asset_class = 'Level_3_Asset' then pv_cde else 0 end) level_3_asset
from sec_join
group by cpty_type, direction, margin_type
order by cpty_type, direction, margin_type
;
