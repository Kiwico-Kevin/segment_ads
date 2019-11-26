include: "*.view.lkml"

view: pages {
  sql_table_name: javascript.pages ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: all_products {
    type: string
    sql: ${TABLE}.all_products ;;
  }

  dimension: anonymous_id {
    type: string
    sql: ${TABLE}.anonymous_id ;;
  }

#   dimension: context_campaign_3_a_2_f_2_fwww_tinkercrate_com_2_fjoin_3_futm_source {
#     type: string
#     sql: ${TABLE}.context_campaign_3_a_2_f_2_fwww_tinkercrate_com_2_fjoin_3_futm_source ;;
#   }
#
#   dimension: context_campaign_3_futm_source {
#     type: string
#     sql: ${TABLE}.context_campaign_3_futm_source ;;
#   }
#
#   dimension: context_campaign_arvestcontent {
#     type: string
#     sql: ${TABLE}.context_campaign_arvestcontent ;;
#   }
#
#   dimension: context_campaign_bingsource {
#     type: string
#     sql: ${TABLE}.context_campaign_bingsource ;;
#   }
#
#   dimension: context_campaign_c_20ampaign {
#     type: string
#     sql: ${TABLE}.context_campaign_c_20ampaign ;;
#   }
#
#   dimension: context_campaign_ca_20mpaign {
#     type: string
#     sql: ${TABLE}.context_campaign_ca_20mpaign ;;
#   }
#
#   dimension: context_campaign_caampaign {
#     type: string
#     sql: ${TABLE}.context_campaign_caampaign ;;
#   }
#
#   dimension: context_campaign_cam_20paign {
#     type: string
#     sql: ${TABLE}.context_campaign_cam_20paign ;;
#   }
#
#   dimension: context_campaign_cam_e2_80_8bpaign {
#     type: string
#     sql: ${TABLE}.context_campaign_cam_e2_80_8bpaign ;;
#   }
#
#   dimension: context_campaign_camfaign {
#     type: string
#     sql: ${TABLE}.context_campaign_camfaign ;;
#   }
#
#   dimension: context_campaign_camp_20aign {
#     type: string
#     sql: ${TABLE}.context_campaign_camp_20aign ;;
#   }
#
#   dimension: context_campaign_camp_e2_80_8baign {
#     type: string
#     sql: ${TABLE}.context_campaign_camp_e2_80_8baign ;;
#   }
#
#   dimension: context_campaign_campa_20ign {
#     type: string
#     sql: ${TABLE}.context_campaign_campa_20ign ;;
#   }
#
#   dimension: context_campaign_campai_20gn {
#     type: string
#     sql: ${TABLE}.context_campaign_campai_20gn ;;
#   }
#
#   dimension: context_campaign_campaigkiwi_cratesn {
#     type: string
#     sql: ${TABLE}.context_campaign_campaigkiwi_cratesn ;;
#   }
#
#   dimension: context_campaign_campaign_5c {
#     type: string
#     sql: ${TABLE}.context_campaign_campaign_5c ;;
#   }
#
#   dimension: context_campaign_campaignn {
#     type: string
#     sql: ${TABLE}.context_campaign_campaignn ;;
#   }
#
#   dimension: context_campaign_campaigzillown {
#     type: string
#     sql: ${TABLE}.context_campaign_campaigzillown ;;
#   }
#
#   dimension: context_campaign_campaingn {
#     type: string
#     sql: ${TABLE}.context_campaign_campaingn ;;
#   }
#
#   dimension: context_campaign_cnnmedium {
#     type: string
#     sql: ${TABLE}.context_campaign_cnnmedium ;;
#   }



#   dimension: context_campaign_conupsent {
#     type: string
#     sql: ${TABLE}.context_campaign_conupsent ;;
#   }

#   dimension: context_campaign_cot {
#     type: string
#     sql: ${TABLE}.context_campaign_cot ;;
#   }
#
#   dimension: context_campaign_e2_80_8bcampaign {
#     type: string
#     sql: ${TABLE}.context_campaign_e2_80_8bcampaign ;;
#   }
#
#   dimension: context_campaign_e2_80_8bmedium {
#     type: string
#     sql: ${TABLE}.context_campaign_e2_80_8bmedium ;;
#   }
#
#   dimension: context_campaign_e2_80_8bsource {
#     type: string
#     sql: ${TABLE}.context_campaign_e2_80_8bsource ;;
#   }
#
#   dimension: context_campaign_glowbug_activitycontent {
#     type: string
#     sql: ${TABLE}.context_campaign_glowbug_activitycontent ;;
#   }
#
#   dimension: context_campaign_how_20to_20create_20privacy_20on_20condo_20bacony_20rulessource {
#     type: string
#     sql: ${TABLE}.context_campaign_how_20to_20create_20privacy_20on_20condo_20bacony_20rulessource ;;
#   }
#
#   dimension: context_campaign_m2x4_20bench_20plansedium {
#     type: string
#     sql: ${TABLE}.context_campaign_m2x4_20bench_20plansedium ;;
#   }
#
#   dimension: context_campaign_m_e2_80_8bedium {
#     type: string
#     sql: ${TABLE}.context_campaign_m_e2_80_8bedium ;;
#   }
#
#   dimension: context_campaign_medi_e2_80_8bum {
#     type: string
#     sql: ${TABLE}.context_campaign_medi_e2_80_8bum ;;
#   }
#
#   dimension: context_campaign_medifaum {
#     type: string
#     sql: ${TABLE}.context_campaign_medifaum ;;
#   }
#
#   dimension: context_campaign_medifum {
#     type: string
#     sql: ${TABLE}.context_campaign_medifum ;;
#   }

  dimension: utm_content {
    type: string
    sql: ${TABLE}.context_campaign_content ;;
    group_label: "UTM Variables"
  }

  dimension: utm_medium {
    type: string
    sql: ${TABLE}.context_campaign_medium ;;
    group_label: "UTM Variables"
  }

  dimension: medium_type {
    sql:
     CASE
          WHEN (${TABLE}.referrer LIKE '%google%' OR ${TABLE}.referrer LIKE '%bing%')AND ${TABLE}.context_campaign_medium is null  THEN 'organic'
          WHEN ${TABLE}.context_campaign_name LIKE 'raf-sms-refer' AND ${TABLE}.context_campaign_medium = 'social'  THEN 'raf_message'
          WHEN ${TABLE}.context_campaign_name LIKE 'raf-fb-message-refer' AND ${TABLE}.context_campaign_medium = 'social'  THEN 'raf_message'
          WHEN ${TABLE}.context_campaign_name LIKE 'raf%' AND ${TABLE}.context_campaign_medium = 'social' THEN 'raf_social'
          WHEN ${TABLE}.context_campaign_name LIKE 'ltbx%' AND ${TABLE}.context_campaign_medium = 'social'  THEN 'raf_social'
          WHEN ${TABLE}.context_campaign_name LIKE 'referral' AND ${TABLE}.context_campaign_medium = 'email'  THEN 'raf_message'
          WHEN ${TABLE}.context_campaign_name LIKE 'lgx%' AND ${TABLE}.context_campaign_medium = 'email'  THEN 'email_promo'
          WHEN ${TABLE}.context_campaign_name LIKE 'lg%' AND ${TABLE}.context_campaign_medium = 'email'  THEN 'email_promo'
          WHEN ${TABLE}.context_campaign_name LIKE 'nl%' AND ${TABLE}.context_campaign_medium = 'email'  THEN 'email_promo'
          WHEN ${TABLE}.context_campaign_medium = 'email'  THEN 'email_triggered'
          WHEN ${TABLE}.context_campaign_medium = '(none)' OR ${TABLE}.context_campaign_medium IS NULL THEN 'direct'
          ELSE ${TABLE}.context_campaign_medium
    END;;
    group_label: "UTM Variables"
  }
  dimension: utm_campaign {
    type: string
    sql: ${TABLE}.context_campaign_name ;;
    group_label: "UTM Variables"
  }

  dimension: campaign_type {
    sql:
     CASE
          WHEN ${TABLE}.context_campaign_name LIKE '%welcome%' AND ${TABLE}.context_campaign_medium = 'email' THEN 'Welcome Series'
          WHEN ${TABLE}.context_campaign_source LIKE '%Aban' AND ${TABLE}.context_campaign_medium = 'email'  THEN 'Abandoned Cart'
          WHEN ${TABLE}.context_campaign_content LIKE '%aban' AND ${TABLE}.context_campaign_medium = 'email'  THEN 'Abandoned Cart'
          WHEN ${TABLE}.context_campaign_name LIKE 'lgx%' AND ${TABLE}.context_campaign_medium = 'email'  THEN 'promo_exsub'
          WHEN ${TABLE}.context_campaign_name LIKE 'lg%' AND ${TABLE}.context_campaign_medium = 'email'  THEN 'promo_leadgen'
          WHEN ${TABLE}.context_campaign_name LIKE 'nl%' AND ${TABLE}.context_campaign_medium = 'email'  THEN 'promo_active_sub'
          WHEN ${TABLE}.context_campaign_name LIKE 'rn%' AND ${TABLE}.context_campaign_medium = 'email'  THEN 'Gift Renew'
          WHEN ${TABLE}.context_campaign_name LIKE 'gifterrenew%' AND ${TABLE}.context_campaign_medium = 'email'  THEN 'Gift Renew'
          WHEN ${TABLE}.context_campaign_name LIKE 'renew-r%' AND ${TABLE}.context_campaign_medium = 'email'  THEN 'Extention Offer'
          WHEN ${TABLE}.context_campaign_name LIKE 'givethanks%' AND ${TABLE}.context_campaign_medium = 'email'  THEN 'Thank You Card'
          WHEN ${TABLE}.context_campaign_name LIKE 'ship-conf%' AND ${TABLE}.context_campaign_medium = 'email'  THEN 'Shipping Confirmation'
          WHEN ${TABLE}.context_campaign_name LIKE '%survey%' AND ${TABLE}.context_campaign_medium = 'email'  THEN 'Survey'
          WHEN ${TABLE}.context_campaign_name LIKE 'sgrdraf%' AND ${TABLE}.context_campaign_medium = 'email'  THEN 'Refer a Friend'
          ELSE NULL
     END;;
    group_label: "UTM Variables"
  }

  dimension: utm_source {
    type: string
    sql: ${TABLE}.context_campaign_source ;;
    group_label: "UTM Variables"
  }

  dimension: utm_term {
    type: string
    sql: ${TABLE}.context_campaign_term ;;
    group_label: "UTM Variables"
  }

  dimension: context_ip {
    type: string
    sql: ${TABLE}.context_ip ;;
  }

  dimension: facebook_adname {
    type: string
    sql: if(${TABLE}.context_campaign_medium = 'SMM', ${TABLE}.context_campaign_content, NULL);;
    group_label: "UTM Variables"
  }

  dimension: facebook_campaign {
    type: string
    sql: if(${TABLE}.context_campaign_medium = 'SMM', ${TABLE}.context_campaign_term, NULL);;
    group_label: "UTM Variables"
  }

  dimension: facebook_adset {
    type: string
    sql: if(${TABLE}.context_campaign_medium = 'SMM', ${TABLE}.context_campaign_campaign, NULL);;
    group_label: "UTM Variables"
  }
#
#   dimension: context_campaign_medium_20_20_20_20 {
#     type: string
#     sql: ${TABLE}.context_campaign_medium_20_20_20_20 ;;
#   }
#
#   dimension: context_campaign_medium_5c {
#     type: string
#     sql: ${TABLE}.context_campaign_medium_5c ;;
#   }
#
#   dimension: context_campaign_mediumcnn {
#     type: string
#     sql: ${TABLE}.context_campaign_mediumcnn ;;
#   }
#
#   dimension: context_campaign_meium {
#     type: string
#     sql: ${TABLE}.context_campaign_meium ;;
#   }
#
#   dimension: context_campaign_meradio_netdium {
#     type: string
#     sql: ${TABLE}.context_campaign_meradio_netdium ;;
#   }
#
#   dimension: context_campaign_mountaincraftfdays {
#     type: string
#     sql: ${TABLE}.context_campaign_mountaincraftfdays ;;
#   }
#
#   dimension: context_campaign_mraddish_20kidsedium {
#     type: string
#     sql: ${TABLE}.context_campaign_mraddish_20kidsedium ;;
#   }
#
#   dimension: context_campaign_s_e2_80_8bource {
#     type: string
#     sql: ${TABLE}.context_campaign_s_e2_80_8bource ;;
#   }
#
#   dimension: context_campaign_sairource {
#     type: string
#     sql: ${TABLE}.context_campaign_sairource ;;
#   }
#
#   dimension: context_campaign_so_pinteresturce {
#     type: string
#     sql: ${TABLE}.context_campaign_so_pinteresturce ;;
#   }
#
#   dimension: context_campaign_sorce {
#     type: string
#     sql: ${TABLE}.context_campaign_sorce ;;
#   }
#
#   dimension: context_campaign_soufrce {
#     type: string
#     sql: ${TABLE}.context_campaign_soufrce ;;
#   }

#
#   dimension: context_campaign_source_5c {
#     type: string
#     sql: ${TABLE}.context_campaign_source_5c ;;
#   }
#
#   dimension: context_campaign_sourcork_20board_20squaresce {
#     type: string
#     sql: ${TABLE}.context_campaign_sourcork_20board_20squaresce ;;
#   }
#
#   dimension: context_campaign_sourcse {
#     type: string
#     sql: ${TABLE}.context_campaign_sourcse ;;
#   }
#
#   dimension: context_campaign_sourctarget_20kailua_20black_20fridaye {
#     type: string
#     sql: ${TABLE}.context_campaign_sourctarget_20kailua_20black_20fridaye ;;
#   }
#
#   dimension: context_campaign_sourcyntonia_20brownce {
#     type: string
#     sql: ${TABLE}.context_campaign_sourcyntonia_20brownce ;;
#   }
#
#   dimension: context_campaign_sourpce {
#     type: string
#     sql: ${TABLE}.context_campaign_sourpce ;;
#   }
#
#   dimension: context_campaign_src {
#     type: string
#     sql: ${TABLE}.context_campaign_src ;;
#   }
#
#   dimension: context_campaign_surce {
#     type: string
#     sql: ${TABLE}.context_campaign_surce ;;
#   }


#
#   dimension: context_campaign_term0 {
#     type: string
#     sql: ${TABLE}.context_campaign_term0 ;;
#   }
#
#   dimension: context_campaign_term_5c {
#     type: string
#     sql: ${TABLE}.context_campaign_term_5c ;;
#   }
#
#   dimension: context_campaign_therm {
#     type: string
#     sql: ${TABLE}.context_campaign_therm ;;
#   }
#
#   dimension: context_campaign_utm_campaign {
#     type: string
#     sql: ${TABLE}.context_campaign_utm_campaign ;;
#   }
#
#   dimension: context_campaign_utm_content {
#     type: string
#     sql: ${TABLE}.context_campaign_utm_content ;;
#   }
#
#   dimension: context_campaign_utm_medium {
#     type: string
#     sql: ${TABLE}.context_campaign_utm_medium ;;
#   }
#
#   dimension: context_campaign_utm_source {
#     type: string
#     sql: ${TABLE}.context_campaign_utm_source ;;
#   }
#
#   dimension: context_campaign_uyyy677icontent {
#     type: string
#     sql: ${TABLE}.context_campaign_uyyy677icontent ;;
#   }


#
#   dimension: context_library_name {
#     type: string
#     sql: ${TABLE}.context_library_name ;;
#   }
#
#   dimension: context_library_version {
#     type: string
#     sql: ${TABLE}.context_library_version ;;
#   }

#   dimension: page_path {
#     type: string
#     sql: ${TABLE}.context_page_path ;;
#   }
#
#   dimension: page_referrer {
#     type: string
#     sql: ${TABLE}.context_page_referrer ;;
#   }
#
#   dimension: page_params {
#     type: string
#     sql: ${TABLE}.context_page_search ;;
#   }
#
#   dimension: page_title {
#     type: string
#     sql: ${TABLE}.context_page_title ;;
#   }
#
#   dimension: page_url {
#     type: string
#     sql: ${TABLE}.context_page_url ;;
#   }
#
#   dimension: context_prxuser_agent {
#     type: string
#     sql: ${TABLE}.context_prxuser_agent ;;
#   }

  dimension: user_agent {
    type: string
    sql: ${TABLE}.context_user_agent ;;
  }

  dimension: browser {
    sql:
      CASE
        WHEN ${user_agent} LIKE '%Firefox/%' THEN 'Firefox'
        WHEN ${user_agent} LIKE '%Chrome/%' OR ${user_agent} LIKE '%CriOS%' THEN 'Chrome'
        WHEN ${user_agent} LIKE '%MSIE %' THEN 'IE'
        WHEN ${user_agent} LIKE '%MSIE+%' THEN 'IE'
        WHEN ${user_agent} LIKE '%Trident%' THEN 'IE'
        WHEN ${user_agent} LIKE '%iPhone%' THEN 'iPhone Safari'
        WHEN ${user_agent} LIKE '%iPad%' THEN 'iPad Safari'
        WHEN ${user_agent} LIKE '%Opera%' THEN 'Opera'
        WHEN ${user_agent} LIKE '%BlackBerry%' AND ${user_agent} LIKE '%Version/%' THEN 'BlackBerry WebKit'
        WHEN ${user_agent} LIKE '%BlackBerry%' THEN 'BlackBerry'
        WHEN ${user_agent} LIKE '%Android%' THEN 'Android'
        WHEN ${user_agent} LIKE '%Safari%' THEN 'Safari'
        WHEN ${user_agent} LIKE '%bot%' THEN 'Bot'
        WHEN ${user_agent} LIKE '%http://%' THEN 'Bot'
        WHEN ${user_agent} LIKE '%www.%' THEN 'Bot'
        WHEN ${user_agent} LIKE '%Wget%' THEN 'Bot'
        WHEN ${user_agent} LIKE '%curl%' THEN 'Bot'
        WHEN ${user_agent} LIKE '%urllib%' THEN 'Bot'
        ELSE 'Unknown'
      END;;
  }

  dimension: device {
    sql:
      CASE
        WHEN ${user_agent} LIKE '%iPad%' THEN 'iPad'
        WHEN ${user_agent} LIKE '%iPhone%' THEN 'iPhone'
        WHEN ${user_agent} LIKE '%Android%' THEN 'Android'
        WHEN ${user_agent} LIKE '%Mac OS X%' THEN 'OS X'
        WHEN ${user_agent} LIKE '%X11%' THEN 'Linux'
        WHEN ${user_agent} LIKE '%Windows%' THEN 'Windows'
        ELSE 'Other'
    END;;
  }

  dimension: device_group {
    sql:
      CASE
        WHEN ${device} = 'iPhone' or ${device} = 'Android' THEN 'Mobile'
        WHEN ${device} = 'OS X' or ${device} = 'Linux' or ${device} = 'Windows' THEN 'Desktop'
        WHEN ${device} = 'iPad' THEN 'Tablet'
        ELSE 'Other'
    END;;
  }

  dimension: customer_type {
    type: string
    sql: ${TABLE}.customer ;;
  }

  dimension: customer_bucket {
    sql:
    CASE
      WHEN ${TABLE}.customer like "logged%" OR ${TABLE}.customer like "admin" THEN 'Customer'
      WHEN ${TABLE}.customer like "%visitor" OR ${TABLE}.customer like "lead" THEN 'Visitor'
      ELSE 'Unknown'
    END;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: group_id {
    type: string
    sql: ${TABLE}.group_id ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

#   dimension_group: loaded {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.loaded_at ;;
#   }

#   dimension_group: original_timestamp {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.original_timestamp ;;
#   }

  dimension: page {
    type: string
    sql: ${TABLE}.page ;;
  }

  dimension: path {
    type: string
    sql: ${TABLE}.path ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }



  dimension: path_type {
    sql:
      CASE
        WHEN ${path} LIKE '/' THEN 'Homepage'
        WHEN ${path} LIKE '/kiwicrate_customeraccount/subscriptions' THEN 'Sub Hub'
        WHEN ${path} LIKE '/subscription/manage/index/id/%' THEN 'Manage Subscription'
        WHEN ${path} LIKE '/kiwicrate_customeraccount/orders%' THEN 'Manage Store Orders'
        WHEN ${path} LIKE '/kiwicrate_customeraccount/credits%' THEN 'Rewards'
        WHEN ${path} LIKE '/customer/account/forgotpassword%' THEN 'Forgot Password'
        WHEN ${path} LIKE '/customer/account/login%' THEN 'Account Login'
        WHEN ${path} LIKE '/customer/account%' THEN 'Manage Account'
        WHEN ${path} LIKE '/tinker' THEN 'Tinker Page'
        WHEN ${path} LIKE '/kiwi' THEN 'Kiwi Page'
        WHEN ${path} LIKE '/koala' THEN 'Koala Page'
        WHEN ${path} LIKE '/doodle' THEN 'Doodle Page'
        WHEN ${path} LIKE '/cricket' THEN 'Cricket Page'
        WHEN ${path} LIKE '/eureka' THEN 'Eureka Page'
        WHEN ${path} LIKE '/atlas' THEN 'Atlas Page'
        WHEN ${path} LIKE '/panda' THEN 'Panda Page'
        WHEN ${path} LIKE '/Gifting' THEN 'Gifting Page'
        WHEN ${path} LIKE '/tinker/%' THEN 'Tinker Explore'
        WHEN ${path} LIKE '/kiwi/%' THEN 'Kiwi Explore'
        WHEN ${path} LIKE '/koala/%' THEN 'Koala Explore'
        WHEN ${path} LIKE '/doodle/%' THEN 'Doodle Explore'
        WHEN ${path} LIKE '/cricket/%' THEN 'Cricket Explore'
         WHEN ${path} LIKE '/panda/%' THEN 'Panda Explore'
        WHEN ${path} LIKE '/store%' THEN 'Store'
        WHEN ${path} LIKE '/blog/%' THEN 'Blog'
        WHEN ${path} LIKE '/diy/%' THEN 'DIY'
        WHEN ${path} LIKE '/survey%' THEN 'Survey'
        WHEN ${path} LIKE '/slime%' THEN 'SEO Landing Page'
        WHEN ${path} LIKE '/m/%' OR ${path} LIKE '/try' OR ${path} LIKE '/smarter'OR ${category} LIKE 'Marketing Landing Page' THEN 'Marketing'
        WHEN ${path} LIKE '/checkout%' THEN 'Checkout'
        ELSE 'Other'
    END;;
  }

  dimension: path_funnel {
    type:  yesno
    sql: ${path_type} LIKE 'Homepage' OR
          ${path_type} LIKE 'Kiwi Page' OR
          ${path_type} LIKE 'Koala Page' OR
          ${path_type} LIKE 'Doodle Page' OR
          ${path_type} LIKE 'Cricket Page' OR
          ${path_type} LIKE 'Eureka Page' OR
          ${path_type} LIKE 'Atlas Page' OR
          ${path_type} LIKE 'Tinker Page' OR
          ${path_type} LIKE 'Panda Page' OR
          ${path_type} LIKE 'Store' OR
          ${path_type} LIKE 'Checkout' OR
          ${path_type} LIKE 'Marketing';;
  }

#   dimension_group: received {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.received_at ;;
#   }

  dimension: referrer {
    type: string
    sql: ${TABLE}.referrer ;;
  }

  dimension: search {
    type: string
    sql: ${TABLE}.search ;;
  }

#   dimension_group: sent {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.sent_at ;;
#   }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [
      raw,
      time,
      hour,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.timestamp ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  measure: total_revenue {
    type: sum_distinct
    value_format: "$#,##0.00"
    sql: ${TABLE}.total_revenue ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  dimension: user_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

#   dimension: first_medium {
#     type: string
#     sql: first_value(${utm_medium}) OVER (PARTITION BY ${anonymous_id} ORDER BY ${timestamp_raw} ASC) ;;
#   }

#   dimension_group: uuid_ts {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.uuid_ts ;;
#   }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: distinct_users {
    type: count_distinct
    sql: ${anonymous_id} ;;
  }

  measure: distinct_sessions {
    type: count_distinct
    sql: ${session_id} ;;
  }

#   measure: total_orders {
#     type: number
#     sql:
#       (select Count(Distinct o.id)
#         FROM completed_order as o
#         where o.session_id=${TABLE}.session_id);;
#   }

  measure: conversion_rate {
    type: number
    value_format: "0.00%"
    sql: ${completed_order.distinct_orders}/NULLIF(${distinct_users},0) ;;
  }

  measure: newsletter_conversion {
    type: number
    value_format: "0.00%"
    sql: ${email_submitted.distinct_count}/NULLIF(${distinct_users},0) ;;
  }

  measure: revenue_per_order {
    type: number
    value_format: "$#,##0.00"
    sql:  ${total_revenue}/NULLIF(${completed_order.distinct_orders},0) ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      last_name,
      first_name,
      users.context_campaign_name,
      users.id,
      users.context_library_name,
      users.name
    ]
  }
}
