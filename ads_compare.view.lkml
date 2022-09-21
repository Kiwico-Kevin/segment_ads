view: ads_compare {
  derived_table: {
    sql: with
      fb_perf as (
        select  a.id as ad_id,
                a.name as ad_name,
                ad.name as adset_name,
                c.name as campaign_name,
                i.date_start as date_start,
                sum(i.spend) as spend,
                sum(i.impressions) as impresssions,
                sum(i.clicks) as clicks,
                'Facebook Ads' as source
          from  facebookads.ads_view a
          join  facebookads.insights_view i
            on  a.id = i.ad_id
          join  facebookads.campaigns_view c
            on  a.campaign_id = c.id
          join  facebookads.ad_sets_view ad
            on  a.adset_id = ad.id
      group by  1,2,3,4,5
      ),
      google_perf as (
        select  a.id as ad_id,
                'google_ad_default' as ad_name,
                g.name as adset_name,
                c.name as campaign_name,
                apr.date_start as date_start,
                sum(apr.cost/1000000) as spend,
                sum(apr.impressions) as impresssions,
                sum(apr.clicks) as clicks,
                'Google Ad Words' as source
          from  adwords.ads_view a
          join  adwords.ad_performance_reports_view apr
            on  a.id = apr.ad_id
          join  adwords.ad_groups_view g
            on  a.ad_group_id = g.id
          join  adwords.campaigns_view c
            on  g.campaign_id = c.id
      group by  1,2,3,4,5
      )
        select ad_id,
              ad_name,
              adset_name,
              campaign_name,
              date_start,
                spend,
                impresssions,
                clicks,
                source from google_perf
      union all
        select ad_id,
               ad_name,
               adset_name,
               campaign_name,
              date_start,
                spend,
                impresssions,
                clicks,
                source
        from fb_perf
       ;;
  }

  measure: count {
    type: count_distinct
    sql: ${ad_id} ;;
    drill_fields: [detail*]
  }

  dimension: ad_id {
    type: string
    sql: ${TABLE}.ad_id ;;
  }

  dimension: ad_name {
    type: string
    sql: ${TABLE}.ad_name ;;
  }

  dimension: adset_name {
    type: string
    sql: ${TABLE}.adset_name ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }

  dimension_group: date_start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.date_start ;;
  }

  measure: spend {
    type: sum
    value_format_name: usd
    sql: ${TABLE}.spend ;;
  }

  measure: impresssions {
    type: sum
    sql: ${TABLE}.impresssions ;;
  }

  measure: clicks {
    type: sum
    sql: ${TABLE}.clicks ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  measure: cost_per_click {
    type: number
    sql: ${spend}/NULLIF(${clicks},0) ;;
    value_format_name: usd
  }

  measure: count_campaigns {
    type: count_distinct
    sql: ${campaign_name} ;;
    drill_fields: [campaign_name,count]
  }


  set: detail {
    fields: [
      ad_id,
      ad_name,
      adset_name,
      campaign_name,
      spend,
      impresssions,
      clicks,
      source
    ]
  }
}
