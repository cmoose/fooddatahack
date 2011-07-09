#!/bin/sh

for field in energy_kcal protein lipid_tot ash carbohydrt fiber_td sugar_tot calcium iron magnesium phosphorus potassium sodium zinc copper manganese selenium vit_c thiamin riboflavin niacin panto_acid vit_b6 folate_tot folic_acid food_folate folate_dfe choline vit_b12 vit_a_iu via_a_rae retinol alpha_carot beta_carot beta_crypt lycopene lut_zea vit_e vit_d_mcg vit_d_iu vit_k fa_sat fa_mono fa_poly cholestrl; do
  echo "update abbrev set $field = ($field-(select min($field) from abbrev_copy))/((select max($field) from abbrev_copy)-(select min($field) from abbrev_copy));" | mysql -u root -A fooddatahack
done
