connection: "darpabq"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project

 explore: sandbox_sales_data {
   view_name: sanbox_sales_data
 }

explore: miig_sales {
  view_name: miig_synth_sales
}

explore: galieo_campaign_data{
  view_name: miig_synth_sales
}
