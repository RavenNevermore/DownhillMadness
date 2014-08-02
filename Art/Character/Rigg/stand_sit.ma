//Maya ASCII 2014 scene
//Name: stand_sit.ma
//Last modified: Fri, Jun 27, 2014 06:09:14 PM
//Codeset: 1252
requires maya "2014";
requires -nodeType "mentalrayFramebuffer" -nodeType "mentalrayOutputPass" -nodeType "mentalrayRenderPass"
		 -nodeType "mentalrayUserBuffer" -nodeType "mentalraySubdivApprox" -nodeType "mentalrayCurveApprox"
		 -nodeType "mentalraySurfaceApprox" -nodeType "mentalrayDisplaceApprox" -nodeType "mentalrayOptions"
		 -nodeType "mentalrayGlobals" -nodeType "mentalrayItemsList" -nodeType "mentalrayShader"
		 -nodeType "mentalrayUserData" -nodeType "mentalrayText" -nodeType "mentalrayTessellation"
		 -nodeType "mentalrayPhenomenon" -nodeType "mentalrayLightProfile" -nodeType "mentalrayVertexColors"
		 -nodeType "mentalrayIblShape" -nodeType "mapVizShape" -nodeType "mentalrayCCMeshProxy"
		 -nodeType "cylindricalLightLocator" -nodeType "discLightLocator" -nodeType "rectangularLightLocator"
		 -nodeType "sphericalLightLocator" -nodeType "abcimport" -nodeType "mia_physicalsun"
		 -nodeType "mia_physicalsky" -nodeType "mia_material" -nodeType "mia_material_x" -nodeType "mia_roundcorners"
		 -nodeType "mia_exposure_simple" -nodeType "mia_portal_light" -nodeType "mia_light_surface"
		 -nodeType "mia_exposure_photographic" -nodeType "mia_exposure_photographic_rev" -nodeType "mia_lens_bokeh"
		 -nodeType "mia_envblur" -nodeType "mia_ciesky" -nodeType "mia_photometric_light"
		 -nodeType "mib_texture_vector" -nodeType "mib_texture_remap" -nodeType "mib_texture_rotate"
		 -nodeType "mib_bump_basis" -nodeType "mib_bump_map" -nodeType "mib_passthrough_bump_map"
		 -nodeType "mib_bump_map2" -nodeType "mib_lookup_spherical" -nodeType "mib_lookup_cube1"
		 -nodeType "mib_lookup_cube6" -nodeType "mib_lookup_background" -nodeType "mib_lookup_cylindrical"
		 -nodeType "mib_texture_lookup" -nodeType "mib_texture_lookup2" -nodeType "mib_texture_filter_lookup"
		 -nodeType "mib_texture_checkerboard" -nodeType "mib_texture_polkadot" -nodeType "mib_texture_polkasphere"
		 -nodeType "mib_texture_turbulence" -nodeType "mib_texture_wave" -nodeType "mib_reflect"
		 -nodeType "mib_refract" -nodeType "mib_transparency" -nodeType "mib_continue" -nodeType "mib_opacity"
		 -nodeType "mib_twosided" -nodeType "mib_refraction_index" -nodeType "mib_dielectric"
		 -nodeType "mib_ray_marcher" -nodeType "mib_illum_lambert" -nodeType "mib_illum_phong"
		 -nodeType "mib_illum_ward" -nodeType "mib_illum_ward_deriv" -nodeType "mib_illum_blinn"
		 -nodeType "mib_illum_cooktorr" -nodeType "mib_illum_hair" -nodeType "mib_volume"
		 -nodeType "mib_color_alpha" -nodeType "mib_color_average" -nodeType "mib_color_intensity"
		 -nodeType "mib_color_interpolate" -nodeType "mib_color_mix" -nodeType "mib_color_spread"
		 -nodeType "mib_geo_cube" -nodeType "mib_geo_torus" -nodeType "mib_geo_sphere" -nodeType "mib_geo_cone"
		 -nodeType "mib_geo_cylinder" -nodeType "mib_geo_square" -nodeType "mib_geo_instance"
		 -nodeType "mib_geo_instance_mlist" -nodeType "mib_geo_add_uv_texsurf" -nodeType "mib_photon_basic"
		 -nodeType "mib_light_infinite" -nodeType "mib_light_point" -nodeType "mib_light_spot"
		 -nodeType "mib_light_photometric" -nodeType "mib_cie_d" -nodeType "mib_blackbody"
		 -nodeType "mib_shadow_transparency" -nodeType "mib_lens_stencil" -nodeType "mib_lens_clamp"
		 -nodeType "mib_lightmap_write" -nodeType "mib_lightmap_sample" -nodeType "mib_amb_occlusion"
		 -nodeType "mib_fast_occlusion" -nodeType "mib_map_get_scalar" -nodeType "mib_map_get_integer"
		 -nodeType "mib_map_get_vector" -nodeType "mib_map_get_color" -nodeType "mib_map_get_transform"
		 -nodeType "mib_map_get_scalar_array" -nodeType "mib_map_get_integer_array" -nodeType "mib_fg_occlusion"
		 -nodeType "mib_bent_normal_env" -nodeType "mib_glossy_reflection" -nodeType "mib_glossy_refraction"
		 -nodeType "builtin_bsdf_architectural" -nodeType "builtin_bsdf_architectural_comp"
		 -nodeType "builtin_bsdf_carpaint" -nodeType "builtin_bsdf_ashikhmin" -nodeType "builtin_bsdf_lambert"
		 -nodeType "builtin_bsdf_mirror" -nodeType "builtin_bsdf_phong" -nodeType "contour_store_function"
		 -nodeType "contour_store_function_simple" -nodeType "contour_contrast_function_levels"
		 -nodeType "contour_contrast_function_simple" -nodeType "contour_shader_simple" -nodeType "contour_shader_silhouette"
		 -nodeType "contour_shader_maxcolor" -nodeType "contour_shader_curvature" -nodeType "contour_shader_factorcolor"
		 -nodeType "contour_shader_depthfade" -nodeType "contour_shader_framefade" -nodeType "contour_shader_layerthinner"
		 -nodeType "contour_shader_widthfromcolor" -nodeType "contour_shader_widthfromlightdir"
		 -nodeType "contour_shader_widthfromlight" -nodeType "contour_shader_combi" -nodeType "contour_only"
		 -nodeType "contour_composite" -nodeType "contour_ps" -nodeType "mi_metallic_paint"
		 -nodeType "mi_metallic_paint_x" -nodeType "mi_bump_flakes" -nodeType "mi_car_paint_phen"
		 -nodeType "mi_metallic_paint_output_mixer" -nodeType "mi_car_paint_phen_x" -nodeType "physical_lens_dof"
		 -nodeType "physical_light" -nodeType "dgs_material" -nodeType "dgs_material_photon"
		 -nodeType "dielectric_material" -nodeType "dielectric_material_photon" -nodeType "oversampling_lens"
		 -nodeType "path_material" -nodeType "parti_volume" -nodeType "parti_volume_photon"
		 -nodeType "transmat" -nodeType "transmat_photon" -nodeType "mip_rayswitch" -nodeType "mip_rayswitch_advanced"
		 -nodeType "mip_rayswitch_environment" -nodeType "mip_card_opacity" -nodeType "mip_motionblur"
		 -nodeType "mip_motion_vector" -nodeType "mip_matteshadow" -nodeType "mip_cameramap"
		 -nodeType "mip_mirrorball" -nodeType "mip_grayball" -nodeType "mip_gamma_gain" -nodeType "mip_render_subset"
		 -nodeType "mip_matteshadow_mtl" -nodeType "mip_binaryproxy" -nodeType "mip_rayswitch_stage"
		 -nodeType "mip_fgshooter" -nodeType "mib_ptex_lookup" -nodeType "misss_physical"
		 -nodeType "misss_physical_phen" -nodeType "misss_fast_shader" -nodeType "misss_fast_shader_x"
		 -nodeType "misss_fast_shader2" -nodeType "misss_fast_shader2_x" -nodeType "misss_skin_specular"
		 -nodeType "misss_lightmap_write" -nodeType "misss_lambert_gamma" -nodeType "misss_call_shader"
		 -nodeType "misss_set_normal" -nodeType "misss_fast_lmap_maya" -nodeType "misss_fast_simple_maya"
		 -nodeType "misss_fast_skin_maya" -nodeType "misss_fast_skin_phen" -nodeType "misss_fast_skin_phen_d"
		 -nodeType "misss_mia_skin2_phen" -nodeType "misss_mia_skin2_phen_d" -nodeType "misss_lightmap_phen"
		 -nodeType "misss_mia_skin2_surface_phen" -nodeType "surfaceSampler" -nodeType "mib_data_bool"
		 -nodeType "mib_data_int" -nodeType "mib_data_scalar" -nodeType "mib_data_vector"
		 -nodeType "mib_data_color" -nodeType "mib_data_string" -nodeType "mib_data_texture"
		 -nodeType "mib_data_shader" -nodeType "mib_data_bool_array" -nodeType "mib_data_int_array"
		 -nodeType "mib_data_scalar_array" -nodeType "mib_data_vector_array" -nodeType "mib_data_color_array"
		 -nodeType "mib_data_string_array" -nodeType "mib_data_texture_array" -nodeType "mib_data_shader_array"
		 -nodeType "mib_data_get_bool" -nodeType "mib_data_get_int" -nodeType "mib_data_get_scalar"
		 -nodeType "mib_data_get_vector" -nodeType "mib_data_get_color" -nodeType "mib_data_get_string"
		 -nodeType "mib_data_get_texture" -nodeType "mib_data_get_shader" -nodeType "mib_data_get_shader_bool"
		 -nodeType "mib_data_get_shader_int" -nodeType "mib_data_get_shader_scalar" -nodeType "mib_data_get_shader_vector"
		 -nodeType "mib_data_get_shader_color" -nodeType "user_ibl_env" -nodeType "user_ibl_rect"
		 -nodeType "mia_material_x_passes" -nodeType "mi_metallic_paint_x_passes" -nodeType "mi_car_paint_phen_x_passes"
		 -nodeType "misss_fast_shader_x_passes" -dataType "byteArray" "Mayatomr" "2014.0 - 3.11.1.9 ";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2014";
fileInfo "version" "2014";
fileInfo "cutIdentifier" "201307170459-880822";
fileInfo "osv" "Microsoft Windows 8 Home Premium Edition, 64-bit  (Build 9200)\n";
fileInfo "license" "student";
createNode transform -s -n "persp";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 86.227959950003282 18.516226696580347 -0.98156015289053444 ;
	setAttr ".r" -type "double3" 358.79999999590757 1168.3999999999924 0 ;
	setAttr ".rp" -type "double3" 8.8817841970012523e-016 -1.8873791418627661e-014 1.1368683772161603e-013 ;
	setAttr ".rpt" -type "double3" -3.4443659478033832e-013 7.8904613967898901e-014 
		-1.3228798831020109e-014 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999979;
	setAttr ".coi" 83.52963381335563;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 3.5527136788005009e-015 29.040758341463793 0 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".t" -type "double3" 7.5697898864746095e-008 -4.8446655273437501e-006 0 ;
	setAttr ".r" -type "double3" -90 0 0 ;
	setAttr ".s" -type "double3" 2.54 2.54 2.54 ;
	setAttr ".rp" -type "double3" -1.3234889800848443e-023 0 8.4703294725430034e-022 ;
	setAttr ".rpt" -type "double3" 0 8.4703294725430034e-022 -8.4703294725430034e-022 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v";
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 46.348302855199563;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.88169851606142124 0.73112074303072372 100.1 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 80.628378934082647;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 100.1 39.391571092370157 -0.26245744708678664 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 119.67616624874427;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "left";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -100.1 0.94848649813845221 1.6391999456571096 ;
	setAttr ".r" -type "double3" 0 -89.999999999999986 0 ;
createNode camera -n "leftShape" -p "left";
	setAttr -k off ".v";
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 12.798022525804036;
	setAttr ".imn" -type "string" "left1";
	setAttr ".den" -type "string" "left1_depth";
	setAttr ".man" -type "string" "left1_mask";
	setAttr ".hc" -type "string" "viewSet -ls %camera";
	setAttr ".o" yes;
createNode transform -n "Global_CTL";
	setAttr ".ove" yes;
createNode nurbsCurve -n "Global_CTLShape" -p "Global_CTL";
	setAttr -k off ".v";
	setAttr ".tw" yes;
createNode transform -n "Controllers" -p "Global_CTL";
createNode transform -n "L_foot_CTL_GRP" -p "Controllers";
	setAttr ".t" -type "double3" 2.935 0 1.677 ;
createNode transform -n "L_foot_CTL" -p "L_foot_CTL_GRP";
	addAttr -ci true -sn "footRoll" -ln "footRoll" -min -10 -max 5 -at "double";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" -0.086510407333173056 1.9813330194712 -1.4049017565842945 ;
	setAttr ".sp" -type "double3" -0.086510407333173056 1.9813330194712 -1.4049017565842945 ;
	setAttr -k on ".footRoll";
createNode nurbsCurve -n "L_foot_CTLShape" -p "L_foot_CTL";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		1.9224291751856137 -3.7665076334574372e-016 -3.0944965511045055
		-3.1017406163052064e-016 -3.487168441782823e-016 -4.3762789912887623
		-1.922429175185612 -3.7665076334574367e-016 -3.0944965511045077
		-1.3352133253318428 -4.4408920985006257e-016 -1.2681361658196563e-015
		-2.7684029237687016 -5.1152765635438156e-016 3.0944965511045064
		-8.0325609692253515e-016 -5.3946157552184293e-016 4.3762789912887632
		2.7684029237686998 -5.1152765635438156e-016 3.0944965511045077
		1.3352133253318428 -4.4408920985006271e-016 2.3505079831794557e-015
		1.9224291751856137 -3.7665076334574372e-016 -3.0944965511045055
		-3.1017406163052064e-016 -3.487168441782823e-016 -4.3762789912887623
		-1.922429175185612 -3.7665076334574367e-016 -3.0944965511045077
		;
createNode joint -n "L_invHeel_JNT" -p "L_foot_CTL";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -0.087000000000000188 0 -2.6770000000000009 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -89.999999999999986 0 ;
	setAttr ".ssc" no;
	setAttr ".radi" 0.5;
createNode joint -n "L_invToe_JNT" -p "L_invHeel_JNT";
	setAttr ".t" -type "double3" 5.9999688572811554 -9.6253321326569222e-005 -0.00048959266637504939 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -179.99999999959061 2.6144159619531183e-012 179.99910970384207 ;
	setAttr ".radi" 0.5;
createNode joint -n "L_invBall_JNT" -p "L_invToe_JNT";
	setAttr ".t" -type "double3" 1.6846309759046765 1.0164395367051604e-020 -1.3322676295501878e-015 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 4.3675660033387078e-011 1.4713250213217387e-010 33.066596865202968 ;
	setAttr ".radi" 0.5;
createNode joint -n "L_invAnkle_JNT" -p "L_invBall_JNT";
	setAttr ".t" -type "double3" 3.6314275049348734 3.1086244689504383e-015 -9.3254293176414649e-012 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -33.067487161360908 -89.999999999723514 0 ;
	setAttr ".radi" 0.5;
createNode ikHandle -n "L_ankle_IK" -p "L_invAnkle_JNT";
	setAttr ".t" -type "double3" 2.6645352591003757e-015 1.7716139202983427e-005 2.7579437023028675e-007 ;
	setAttr ".r" -type "double3" -9.5416645397469678e-015 -2.2909650053905826e-010 1.2560496795808095e-010 ;
	setAttr ".s" -type "double3" 0.99999999999999967 1 0.99999999999999967 ;
	setAttr ".roc" yes;
createNode poleVectorConstraint -n "L_ankle_IK_poleVectorConstraint1" -p "L_ankle_IK";
	addAttr -ci true -k true -sn "w0" -ln "L_knee_CTLW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 0.0034765667525458177 -4.8693109469358271 3.6266040929074768 ;
	setAttr -k on ".w0";
createNode ikHandle -n "L_ball_IK" -p "L_invBall_JNT";
	setAttr ".t" -type "double3" -3.5527136788005009e-015 2.2204460492503131e-015 3.7703173916270321e-013 ;
	setAttr ".s" -type "double3" 0.99999999999999989 1 0.99999999999999989 ;
	setAttr ".pv" -type "double3" 9.9920072216264089e-016 -2 8.0363419641785805e-012 ;
	setAttr ".roc" yes;
createNode ikHandle -n "L_toe_IK" -p "L_invToe_JNT";
	setAttr ".t" -type "double3" 1.7763568394002505e-015 -1.1222475043443788e-015 4.5208281562736374e-013 ;
	setAttr ".s" -type "double3" 0.99999999999999989 1 0.99999999999999989 ;
	setAttr ".pv" -type "double3" 1.3767809049942958e-015 -2.0000000000000009 9.6501001501843465e-012 ;
	setAttr ".roc" yes;
createNode transform -n "L_knee_CTL_GRP" -p "L_foot_CTL";
	setAttr ".t" -type "double3" -0.086510407333171724 6.3396042460715227 2.323 ;
createNode transform -n "L_knee_CTL" -p "L_knee_CTL_GRP";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0.0034765667525444854 0.28929875433807312 0.046881337547540702 ;
	setAttr ".sp" -type "double3" 0.0034765667522851373 0.28929875433802604 0.046881337547613533 ;
createNode nurbsCurve -n "L_knee_CTLShape" -p "L_knee_CTL";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 11 0 no 3
		16 0 0 0 1 2 3 4 5 6 7 8 9 10 11 11 11
		14
		0.064642665095978602 0.47987050126797409 0.037971209621762314
		0.2458063517817595 -0.22616533098672328 0.061392438387693399
		-0.56073972815606765 -0.2909415248644221 0.016399746624024159
		-1.1423261291002929 0.33682704237941097 0.031126563058348655
		-0.68877998844275889 1.1785395026315839 0.054948040097530654
		0.029837132230596135 1.3703616966882453 0.039371398543744496
		0.85843178335688597 1.0680808231238661 0.04176624548598068
		0.95701782991796724 0.25861688599459104 0.0384712663958095
		0.88225617930657796 -0.43962486823523333 0.029198007026566442
		0.30828557966516829 -0.93438615719737195 0.047752573887773542
		-0.44807538517303935 -1.0159347990065275 0.037887656876822835
		-1.1014500585633495 -0.75797682714063375 0.020595366937866288
		-1.5954591466984027 -0.22721455001312635 0.04799449577789372
		-1.594449214233632 0.56355769326351313 0.029690875111113069
		;
createNode transform -n "R_foot_CTL_GRP" -p "Controllers";
	setAttr ".t" -type "double3" -2.9351774854210113 0 1.6769388229546529 ;
createNode transform -n "R_foot_CTL" -p "R_foot_CTL_GRP";
	addAttr -ci true -sn "footRoll" -ln "footRoll" -min -10 -max 5 -at "double";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0.087177448051264594 1.9813330194534355 -1.4048405794574594 ;
	setAttr ".sp" -type "double3" 0.087177448051264594 1.9813330194534355 -1.4048405794574594 ;
	setAttr -k on ".footRoll";
createNode nurbsCurve -n "R_foot_CTLShape" -p "R_foot_CTL";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		1.9224291751856137 -3.7665076334574372e-016 -3.0944965511045055
		-3.1017406163052064e-016 -3.487168441782823e-016 -4.3762789912887623
		-1.922429175185612 -3.7665076334574367e-016 -3.0944965511045077
		-1.3352133253318428 -4.4408920985006257e-016 -1.2681361658196563e-015
		-2.7684029237687016 -5.1152765635438156e-016 3.0944965511045064
		-8.0325609692253515e-016 -5.3946157552184293e-016 4.3762789912887632
		2.7684029237686998 -5.1152765635438156e-016 3.0944965511045077
		1.3352133253318428 -4.4408920985006271e-016 2.3505079831794557e-015
		1.9224291751856137 -3.7665076334574372e-016 -3.0944965511045055
		-3.1017406163052064e-016 -3.487168441782823e-016 -4.3762789912887623
		-1.922429175185612 -3.7665076334574367e-016 -3.0944965511045077
		;
createNode joint -n "R_invHeel_JNT" -p "R_foot_CTL";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.08703781698853108 0 -2.6769388229546536 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -89.999999999999986 0 ;
	setAttr ".ssc" no;
	setAttr ".radi" 0.5;
createNode joint -n "R_invToe_JNT" -p "R_invHeel_JNT";
	setAttr ".t" -type "double3" 5.9999688572811554 -9.6253321326569222e-005 0.0053944530555147807 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -179.99999999959061 2.6144159619531183e-012 179.99910970384207 ;
	setAttr ".radi" 0.5;
createNode joint -n "R_invBall_JNT" -p "R_invToe_JNT";
	setAttr ".t" -type "double3" 1.6846309759046765 1.0164395367051604e-020 -1.3322676295501878e-015 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 33.066596865202968 ;
	setAttr ".radi" 0.5;
createNode joint -n "R_invAnkle_JNT" -p "R_invBall_JNT";
	setAttr ".t" -type "double3" 3.6314275049348734 3.1086244689504383e-015 -9.3254293176414649e-012 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -33.067487161360908 -89.999999999723514 0 ;
	setAttr ".radi" 0.5;
createNode ikHandle -n "R_ankle_IK" -p "R_invAnkle_JNT";
	setAttr ".t" -type "double3" 0 -1.6530776747458734e-011 3.0668245720733012e-012 ;
	setAttr ".r" -type "double3" -9.5416645397469647e-015 -2.2909650053905826e-010 1.2560496708451554e-010 ;
	setAttr ".s" -type "double3" 0.99999999999999967 1 0.99999999999999967 ;
	setAttr ".roc" yes;
createNode poleVectorConstraint -n "R_ankle_IK_poleVectorConstraint1" -p "R_ankle_IK";
	addAttr -ci true -k true -sn "w0" -ln "R_knee_CTLW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 0.0034765658089406237 -4.8693149001205214 3.6069703809544182 ;
	setAttr -k on ".w0";
createNode ikHandle -n "R_ball_IK" -p "R_invBall_JNT";
	setAttr ".t" -type "double3" -5.0233780406472306e-006 1.231849471317048e-005 0 ;
	setAttr ".s" -type "double3" 0.99999999999999989 1 0.99999999999999989 ;
	setAttr ".pv" -type "double3" -1.1182172087176312e-005 -1.9999999999687397 -8.7610621906697201e-009 ;
	setAttr ".roc" yes;
createNode ikHandle -n "R_toe_IK" -p "R_invToe_JNT";
	setAttr ".t" -type "double3" -1.0930886870319512e-005 1.7001482568160079e-005 0 ;
	setAttr ".s" -type "double3" 0.99999999999999989 1 0.99999999999999989 ;
	setAttr ".pv" -type "double3" -1.1182213515155723e-005 -1.9999999999687388 -7.1862962854988473e-008 ;
	setAttr ".roc" yes;
createNode transform -n "R_knee_CTL_GRP" -p "R_foot_CTL";
	setAttr ".t" -type "double3" 0.087177484477406253 6.3396002928868302 2.3230611770453473 ;
createNode transform -n "R_knee_CTL" -p "R_knee_CTL_GRP";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0.0034765667525444854 0.28929875433807312 0.027247625594482239 ;
	setAttr ".sp" -type "double3" 0.0034765667528038335 0.28929875433802604 0.027247625594409408 ;
createNode nurbsCurve -n "R_knee_CTLShape" -p "R_knee_CTL";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 11 0 no 3
		16 0 0 0 1 2 3 4 5 6 7 8 9 10 11 11 11
		14
		-0.057689531590898895 0.47987050126798642 0.0011366736742227657
		-0.2388532182766788 -0.22616533098671188 -0.022284555091683863
		0.56769286166114674 -0.29094152486440872 0.022708136672014045
		1.1492792626053721 0.33682704237942374 0.0079813202376812775
		0.69573312194783887 1.1785395026315957 -0.015840156801551375
		-0.022883998725516587 1.3703616966882572 -0.00026351524779644198
		-0.85147864985180588 1.0680808231238781 -0.0026583621900462817
		-0.95006469641288716 0.25861688599460331 0.00063661690015642813
		-0.87530304580149809 -0.43962486823522062 0.0099098762694317943
		-0.30133244616008786 -0.93438615719735985 -0.0086446905917356709
		0.45502851867811928 -1.0159347990065153 0.0012202264192427981
		1.1084031920684283 -0.75797682714062053 0.018512516358209271
		1.6024122802034826 -0.22721455001311419 -0.0088866124818250403
		1.6014023477387107 0.56355769326352589 0.009417008184921638
		;
createNode transform -n "pelvis_CTL_GRP" -p "Controllers";
	setAttr ".t" -type "double3" 1.4248023943560072e-016 12.229527782038836 0.48709851369588864 ;
createNode transform -n "pelvis_CTL" -p "pelvis_CTL_GRP";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 1.4248023943560072e-016 0 0 ;
	setAttr ".sp" -type "double3" 1.4248023943560072e-016 0 0 ;
createNode nurbsCurve -n "pelvis_CTLShape" -p "pelvis_CTL";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		1.2576978115237355e-014 7.6103995155394421e-016 -17.576872315261756
		-1.0471706075205862 9.0680372949426934e-017 -1.0471706075205862
		-17.576872315261753 7.610399515539445e-016 1.7763568394002505e-015
		-1.0471706075205915 -4.8552819231151388e-032 1.0471706075206022
		-5.1865902787651507e-015 -7.6103995155394431e-016 17.576872315261749
		1.047170607520604 -9.0680372949427131e-017 1.047170607520604
		17.576872315261749 -7.610399515539447e-016 5.3290705182007514e-015
		1.0471706075206058 -1.2353432787255216e-031 -1.0471706075205933
		1.2576978115237355e-014 7.6103995155394421e-016 -17.576872315261756
		-1.0471706075205862 9.0680372949426934e-017 -1.0471706075205862
		-17.576872315261753 7.610399515539445e-016 1.7763568394002505e-015
		;
createNode transform -n "spine_CTL_GRP" -p "pelvis_CTL";
	setAttr ".t" -type "double3" -3.0566424650183748e-017 3.7359913749200895 0.07186931591239043 ;
createNode transform -n "Spine_CTL" -p "spine_CTL_GRP";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "Spine_CTLShape" -p "Spine_CTL";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		4.1483625128829384 4.4408920985006262e-016 -4.1483625128829331
		-6.6931695916051617e-016 4.4408920985006262e-016 -4.0518691667858961
		-4.1483625128829349 4.4408920985006262e-016 -4.1483625128829349
		-5.8666705273591804 0 -1.6930901125533637e-015
		-4.1483625128829358 -4.4408920985006262e-016 4.1483625128829331
		-1.7677423245296312e-015 -4.4408920985006262e-016 4.051869166785897
		4.1483625128829322 -4.4408920985006262e-016 4.1483625128829349
		5.8666705273591804 0 3.1502578323738817e-015
		4.1483625128829384 4.4408920985006262e-016 -4.1483625128829331
		-6.6931695916051617e-016 4.4408920985006262e-016 -4.0518691667858961
		-4.1483625128829349 4.4408920985006262e-016 -4.1483625128829349
		;
createNode transform -n "breast_CTL_GRP" -p "Spine_CTL";
	setAttr ".t" -type "double3" -1.8699136706208024e-016 3.429749931146723 0.45528493090694477 ;
createNode transform -n "breast_CTL" -p "breast_CTL_GRP";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "breast_CTLShape" -p "breast_CTL";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		2.4775105184153254 1.5170376631156114e-016 -2.4775105184153214
		-3.9973358194328393e-016 2.1454152378088857e-016 -9.4637179799469351
		-2.4775105184153228 1.5170376631156124e-016 -2.4775105184153228
		-0.11848754729121991 6.2168766186563869e-032 -1.0152930008856135e-015
		-2.4775105184153237 -1.5170376631156122e-016 2.4775105184153223
		-1.0557419196777187e-015 -2.1454152378088864e-016 9.4637179799469386
		2.4775105184153214 -1.5170376631156127e-016 2.4775105184153232
		0.11848754729121991 -1.152306709362601e-031 1.8818596678893567e-015
		2.4775105184153254 1.5170376631156114e-016 -2.4775105184153214
		-3.9973358194328393e-016 2.1454152378088857e-016 -9.4637179799469351
		-2.4775105184153228 1.5170376631156124e-016 -2.4775105184153228
		;
createNode transform -n "R_shoulder_CTL_GRP" -p "breast_CTL";
	setAttr ".t" -type "double3" 1.8699136706208024e-016 -3.429749931146723 -0.45528493090694477 ;
	setAttr ".rp" -type "double3" -4.3940500000000018 4.0569808430410887 -0.20782482960828019 ;
	setAttr ".sp" -type "double3" -4.3940500000000018 4.0569808430410887 -0.20782482960828019 ;
createNode transform -n "R_shoulder_CTL" -p "R_shoulder_CTL_GRP";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" -4.3940500000000018 4.0569808430410887 -0.20782482960828019 ;
	setAttr ".sp" -type "double3" -4.3940500000000018 4.0569808430410887 -0.20782482960828019 ;
createNode nurbsCurve -n "R_shoulder_CTLShape" -p "R_shoulder_CTL";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		-4.3940500000000009 7.2878943419294941 -3.4387383284966813
		-4.3940500000000018 4.0569808430410879 -4.7770265185905698
		-4.3940500000000027 0.82606734415268612 -3.438738328496683
		-4.3940500000000027 -0.51222084594120076 -0.20782482960828152
		-4.3940500000000027 0.82606734415268512 3.0230886692801215
		-4.3940500000000018 4.056980843041087 4.3613768593740101
		-4.3940500000000009 7.2878943419294897 3.0230886692801229
		-4.3940500000000009 8.6261825320233783 -0.20782482960827775
		-4.3940500000000009 7.2878943419294941 -3.4387383284966813
		-4.3940500000000018 4.0569808430410879 -4.7770265185905698
		-4.3940500000000027 0.82606734415268612 -3.438738328496683
		;
createNode transform -n "R_wrist_CTL_GRP" -p "R_shoulder_CTL";
	setAttr ".t" -type "double3" 0 0 -1.1102230246251563e-016 ;
	setAttr ".rp" -type "double3" -11.782000000000007 3.7641808430410784 -0.21952982960827999 ;
	setAttr ".sp" -type "double3" -11.782000000000007 3.7641808430410784 -0.21952982960827999 ;
createNode transform -n "R_wrist_CTL" -p "R_wrist_CTL_GRP";
	addAttr -ci true -sn "wristCurl" -ln "wristCurl" -min -10 -max 10 -at "double";
	addAttr -ci true -sn "Finger_A_Curl" -ln "Finger_A_Curl" -min 0 -max 10 -at "double";
	addAttr -ci true -sn "Finger_B_Curl" -ln "Finger_B_Curl" -min 0 -max 10 -at "double";
	addAttr -ci true -sn "ThumbCurl" -ln "ThumbCurl" -min 0 -max 10 -at "double";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" -11.782000000000007 3.7641808430410784 -0.21952982960827999 ;
	setAttr ".sp" -type "double3" -11.782000000000007 3.7641808430410784 -0.21952982960827999 ;
	setAttr -k on ".wristCurl";
	setAttr -k on ".Finger_A_Curl";
	setAttr -k on ".Finger_B_Curl";
	setAttr -k on ".ThumbCurl";
createNode nurbsCurve -n "R_wrist_CTLShape" -p "R_wrist_CTL";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		-11.782000000000007 5.913549713756975 -2.368898700324173
		-11.782000000000007 3.7641808430410779 -3.2591964371172417
		-11.782000000000007 1.6148119723251839 -2.3688987003241744
		-11.782000000000007 0.72451423553211658 -0.21952982960828088
		-11.782000000000007 1.6148119723251835 1.9298390411076141
		-11.782000000000007 3.7641808430410775 2.8201367779006827
		-11.782000000000007 5.9135497137569715 1.9298390411076149
		-11.782000000000007 6.8038474505500401 -0.21952982960827835
		-11.782000000000007 5.913549713756975 -2.368898700324173
		-11.782000000000007 3.7641808430410779 -3.2591964371172417
		-11.782000000000007 1.6148119723251839 -2.3688987003241744
		;
createNode ikHandle -n "R_wrist_IK" -p "R_wrist_CTL";
	setAttr ".t" -type "double3" 0 0 1.4793868852169824e-008 ;
	setAttr ".rp" -type "double3" -11.782000000000007 3.7641808430410784 -0.21952982960827999 ;
	setAttr ".sp" -type "double3" -11.782000000000007 3.7641808430410784 -0.21952982960827999 ;
	setAttr ".pv" -type "double3" -0.0031102971091192806 0.1581806370140541 -1.9937324825878573 ;
	setAttr ".roc" yes;
createNode transform -n "R_IKFK_Blend_GRP" -p "R_wrist_CTL";
	setAttr ".t" -type "double3" 0 0 2.2204460492503131e-016 ;
	setAttr ".rp" -type "double3" -8 4.0344808430410737 -3.058967829608279 ;
	setAttr ".sp" -type "double3" -8 4.0344808430410737 -3.058967829608279 ;
createNode transform -n "R_IKFK_Blend" -p "R_IKFK_Blend_GRP";
	addAttr -ci true -sn "IK_FK_Blend" -ln "IK_FK_Blend" -dv 1 -min 0 -max 1 -at "double";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" -1.7763568394002505e-015 0 0 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 8.4012936267944433e-014 -6.191807683928344e-009 4.691318154704734e-014 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" -8 4.0344808430410737 -3.058967829608279 ;
	setAttr ".sp" -type "double3" -8 4.0344808430410737 -3.058967829608279 ;
	setAttr -k on ".IK_FK_Blend";
createNode nurbsCurve -n "R_IKFK_BlendShape" -p "R_IKFK_Blend";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		-6.7648541036159031 6.0422198289849014 -3.0589678296082794
		-8 1.4073172191720502 -3.0589678296082781
		-9.2351458963840969 6.0422198289849032 -3.0589678296082794
		-10.338379807347737 4.0344808430410746 -3.058967829608279
		-9.2351458963840969 2.0267418570972442 -3.0589678296082785
		-8 6.6616444669100963 -3.0589678296082798
		-6.7648541036159049 2.0267418570972442 -3.0589678296082785
		-5.661620192652264 4.0344808430410728 -3.058967829608279
		-6.7648541036159031 6.0422198289849014 -3.0589678296082794
		-8 1.4073172191720502 -3.0589678296082781
		-9.2351458963840969 6.0422198289849032 -3.0589678296082794
		;
createNode transform -n "L_shoulder_CTL_GRP" -p "breast_CTL";
	setAttr ".t" -type "double3" 1.8699136706208024e-016 -3.429749931146723 -0.45528493090694477 ;
	setAttr ".rp" -type "double3" 4.3940544309050047 4.05695682145166 -0.20782508853544568 ;
	setAttr ".sp" -type "double3" 4.3940544309050047 4.05695682145166 -0.20782508853544568 ;
createNode transform -n "L_shoulder_CTL" -p "L_shoulder_CTL_GRP";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 4.3940544309050047 4.05695682145166 -0.20782508853544568 ;
	setAttr ".sp" -type "double3" 4.3940544309050047 4.05695682145166 -0.20782508853544568 ;
createNode nurbsCurve -n "L_shoulder_CTLShape" -p "L_shoulder_CTL";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		4.3940544309050056 7.2878703203400654 -3.4387385874238467
		4.3940544309050047 4.0569568214516591 -4.7770267775177349
		4.3940544309050038 0.8260433225632573 -3.4387385874238485
		4.3940544309050038 -0.51224486753062948 -0.20782508853544701
		4.3940544309050038 0.82604332256325641 3.0230884103529561
		4.3940544309050047 4.0569568214516583 4.3613766004468451
		4.3940544309050056 7.287870320340061 3.0230884103529574
		4.3940544309050056 8.6261585104339495 -0.20782508853544324
		4.3940544309050056 7.2878703203400654 -3.4387385874238467
		4.3940544309050047 4.0569568214516591 -4.7770267775177349
		4.3940544309050038 0.8260433225632573 -3.4387385874238485
		;
createNode transform -n "L_wrist_CTL_GRP" -p "L_shoulder_CTL";
	setAttr ".t" -type "double3" 0 0 -1.1102230246251563e-016 ;
	setAttr ".rp" -type "double3" 11.782 3.7641808430410784 -0.21952982960827999 ;
	setAttr ".sp" -type "double3" 11.782 3.7641808430410784 -0.21952982960827999 ;
createNode transform -n "L_wrist_CTL" -p "L_wrist_CTL_GRP";
	addAttr -ci true -sn "wristCurl" -ln "wristCurl" -min -10 -max 10 -at "double";
	addAttr -ci true -sn "FingerA_Curl" -ln "FingerA_Curl" -min 0 -max 10 -at "double";
	addAttr -ci true -sn "FingerB_Curl" -ln "FingerB_Curl" -min 0 -max 10 -at "double";
	addAttr -ci true -sn "ThumbCurl" -ln "ThumbCurl" -min 0 -max 10 -at "double";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 11.80010151247942 3.7641808430410784 -0.21952982960827999 ;
	setAttr ".sp" -type "double3" 11.80010151247942 3.7641808430410784 -0.21952982960827999 ;
	setAttr -k on ".wristCurl";
	setAttr -k on ".FingerA_Curl";
	setAttr -k on ".FingerB_Curl";
	setAttr -k on ".ThumbCurl";
createNode nurbsCurve -n "L_wrist_CTLShape" -p "L_wrist_CTL";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		11.787720718575954 5.9138432058623014 -2.3685695050487401
		11.7904194377675 3.7646060140095314 -3.2591809874657005
		11.79878978501338 1.6151197627697718 -2.3692060464928639
		11.807928524418729 0.72452434598476856 -0.21997993237992616
		11.812482306382886 1.6145184802198576 1.9295098458321811
		11.80978358719134 3.763755672072624 2.8201213282491415
		11.801413239945461 5.9132419233123841 1.9301463872763045
		11.792274500540112 6.8038373400973882 -0.21907972683663307
		11.787720718575954 5.9138432058623014 -2.3685695050487401
		11.7904194377675 3.7646060140095314 -3.2591809874657005
		11.79878978501338 1.6151197627697718 -2.3692060464928639
		;
createNode ikHandle -n "L_wrist_IK" -p "L_wrist_CTL";
	setAttr ".rp" -type "double3" 11.80009469576582 3.7641946608295034 -0.21952982292553583 ;
	setAttr ".sp" -type "double3" 11.80009469576582 3.7641946608295034 -0.21952982292553583 ;
	setAttr ".pv" -type "double3" 0.0031085640176620249 0.15815589994835899 -1.9937344477490655 ;
	setAttr ".roc" yes;
createNode transform -n "L_IKFK_Blend_GRP" -p "L_wrist_CTL";
	setAttr ".t" -type "double3" 8 -23.358708906980688 3.3000000000000007 ;
	setAttr ".rp" -type "double3" 8 4.0344808430410737 -3.058967829608279 ;
	setAttr ".sp" -type "double3" 8 4.0344808430410737 -3.058967829608279 ;
createNode transform -n "L_IKFK_Blend" -p "L_IKFK_Blend_GRP";
	addAttr -ci true -sn "IK_FK_Blend" -ln "IK_FK_Blend" -dv 1 -min 0 -max 1 -at "double";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0.003477626609308615 27.398463363990658 -6.2475633711059126 ;
	setAttr ".sp" -type "double3" 0.003477626609308615 27.398463363990658 -6.2475633711059126 ;
	setAttr -k on ".IK_FK_Blend";
createNode nurbsCurve -n "L_IKFK_BlendShape" -p "L_IKFK_Blend";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		1.235150327292077 29.398612461304459 -6.3179776283703539
		4.4309079800797235e-006 24.763709851491612 -6.317977628370353
		-1.2351414654761159 29.398612461304463 -6.3179776283703539
		-2.338375376439755 27.390873475360635 -6.3179776283703539
		-1.2351414654761168 25.383134489416808 -6.3179776283703539
		4.4309079791915451e-006 30.018037099229659 -6.3179776283703548
		1.2351503272920752 25.383134489416808 -6.3179776283703539
		2.3383842382557161 27.390873475360635 -6.3179776283703539
		1.235150327292077 29.398612461304459 -6.3179776283703539
		4.4309079800797235e-006 24.763709851491612 -6.317977628370353
		-1.2351414654761159 29.398612461304463 -6.3179776283703539
		;
createNode transform -n "neck_CTL_GRP" -p "breast_CTL";
	setAttr ".t" -type "double3" 2.4086569201433078e-016 2.8022394081709123 -0.54528983658817287 ;
createNode transform -n "neck_CTL" -p "neck_CTL_GRP";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "neck_CTLShape" -p "neck_CTL";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		3.3574988804636297 1.2129792577492629e-016 -2.6701073746594877
		-3.1961536309337329e-016 -0.10648001738599848 -3.7231947658523223
		-3.3574988804636234 1.2129792577492634e-016 -2.6701073746594859
		-2.8014799342644681 4.9708339942789462e-032 -6.455966280253359e-016
		-3.3574988804636234 -1.2129792577492632e-016 2.6701073746594881
		-8.441405782078256e-016 -0.10648001738599955 3.7231947658523232
		3.357498880463631 -1.2129792577492637e-016 2.6701073746594846
		2.8014799342644681 -9.2135097961350011e-032 1.1966223099602798e-015
		3.3574988804636297 1.2129792577492629e-016 -2.6701073746594877
		-3.1961536309337329e-016 -0.10648001738599848 -3.7231947658523223
		-3.3574988804636234 1.2129792577492634e-016 -2.6701073746594859
		;
createNode transform -n "head_CTL_GRP" -p "neck_CTL";
	setAttr ".t" -type "double3" 1.0046130365440645e-018 1.2072579547915865 -0.026169436433599091 ;
createNode transform -n "head_CTL" -p "head_CTL_GRP";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 1.6578813973766753e-016 0 0 ;
	setAttr ".sp" -type "double3" 1.6578813973766753e-016 0 0 ;
createNode nurbsCurve -n "head_CTLShape" -p "head_CTL";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		6.0661186219944518 2.1915349268887172e-016 -4.8241827160073392
		-4.1167287364277518e-016 -0.19238142418868193 -6.7268350360046227
		-6.0661186219944394 2.1915349268887185e-016 -4.8241827160073356
		-5.0615384259007703 8.9809914263842476e-032 -1.1664235393640774e-015
		-6.0661186219944394 -2.1915349268887177e-016 4.8241827160073392
		-1.3593521695691679e-015 -0.19238142418868387 6.7268350360046245
		6.0661186219944527 -2.191534926888719e-016 4.8241827160073329
		5.0615384259007703 -1.6646392251527741e-031 2.1619822184249572e-015
		6.0661186219944518 2.1915349268887172e-016 -4.8241827160073392
		-4.1167287364277518e-016 -0.19238142418868193 -6.7268350360046227
		-6.0661186219944394 2.1915349268887185e-016 -4.8241827160073356
		;
createNode joint -n "ANM_pelvis_JNT" -p "Global_CTL";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -90 -18.838400000000007 89.999999999999986 ;
	setAttr ".bps" -type "matrix" 0.32290007322960507 0.94643306298349272 -2.6136868819701564e-016 0
		 -0.94643306298349272 0.3229000732296049 -1.5463920432689909e-016 0 -4.9303806576313238e-032 3.3306690738754686e-016 1.0000000000000002 0
		 0.48709851369588908 12.229527782038836 -3.4322642402426856e-017 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_spine1_JNT" -p "ANM_pelvis_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 179.99999999999997 1.5978918042954642e-014 19.972855188957741 ;
	setAttr ".bps" -type "matrix" -0.019798684561266988 0.9998039868342411 -2.984694239369872e-016 0
		 0.99980398683424143 0.019798684561267044 6.2261526380618446e-016 0 5.6644283774329227e-016 -3.2184988563713467e-016 -1.0000000000000002 0
		 0.5589678296082784 15.965519156958932 1.2201976105756286e-017 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_spine2_JNT" -p "ANM_spine1_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 2;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 3.5311250384401291e-031 -1.7655625192200645e-031 -12.614627352442346 ;
	setAttr ".bps" -type "matrix" -0.23767033851245659 0.97134587567527886 -4.272391123612106e-016 0
		 0.97134587567527919 0.23767033851245659 5.4240253006279987e-016 0 5.6644283774329227e-016 -3.2184988563713467e-016 -1.0000000000000002 0
		 1.0142527605152238 19.395269088105646 3.0028690577938734e-016 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_neck_JNT" -p "ANM_spine2_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 3.2728397933726192e-016 -3.7584013621163934e-015 -9.9535969675468863 ;
	setAttr ".bps" -type "matrix" -0.4019905983253233 0.91564379474665181 -5.1456290682166639e-016 0
		 0.91564379474665214 0.40199059832532325 4.6038981165199426e-016 0 5.6644283774329227e-016 -3.2184988563713467e-016 -1.0000000000000002 0
		 0.46896292392705297 22.197508496276555 -6.1657452569796899e-017 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_head_JNT" -p "ANM_neck_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 4;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 180 -3.1643061752246035e-015 25.250803649944196 ;
	setAttr ".bps" -type "matrix" 0.027016575864453218 0.99963498569655929 -2.6900224756309045e-016 0
		 -0.99963498569655962 0.027016575864453163 -7.5836683791998029e-016 0 -6.888628162981925e-016 3.2515846195276706e-016 1.0000000000000002 0
		 0.44279348749345548 23.404766451068141 -6.8472847780350207e-017 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_brain_JNT" -p "ANM_head_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" 7.2470168697665036 0.57724365801492583 -3.5071498530125067e-016 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 88.45184230102204 89.999999999999972 0 ;
	setAttr ".bps" -type "matrix" 7.0086058612669178e-016 1.1876864898369659e-016 -1.0000000000000002 0
		 -5.8569725406784623e-007 0.99999999999982836 1.5469623699061093e-016 0 0.99999999999982869 5.8569725405743789e-007 7.5082233405134685e-016 0
		 0.061550112723294359 30.66473320309894 -2.8064141068145645e-015 1;
	setAttr ".radi" 0.5;
createNode parentConstraint -n "ANM_head_JNT_parentConstraint1" -p "ANM_head_JNT";
	addAttr -ci true -k true -sn "w0" -ln "head_CTLW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" -1.6578813973766792e-016 -1.4210854715202004e-014 
		2.2204460492503131e-015 ;
	setAttr ".tg[0].tor" -type "double3" -90.000000000000071 -1.5481241409972264 90.000000000000014 ;
	setAttr ".lr" -type "double3" -5.7092407163956108e-014 -3.3916128743182077e-014 
		6.3611093629270493e-015 ;
	setAttr ".rst" -type "double3" 1.1159381223732296 0.46134446549723584 6.876628331328681e-017 ;
	setAttr ".rsrr" -type "double3" -1.845823738942371e-014 -3.1781115409272611e-014 
		1.2722218725854073e-014 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "ANM_neck_JNT_parentConstraint1" -p "ANM_neck_JNT";
	addAttr -ci true -k true -sn "w0" -ln "neck_CTLW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" -2.4651903288156628e-031 -1.0658141036401504e-014 
		6.6613381477509392e-016 ;
	setAttr ".tg[0].tor" -type "double3" 89.999999999999972 23.702679508946986 90 ;
	setAttr ".lr" -type "double3" -2.0666905461334128e-014 1.7355858968671101e-014 -2.0673605429512861e-014 ;
	setAttr ".rst" -type "double3" 2.8515429118308586 0.13634415491535901 2.0005427124054233e-016 ;
	setAttr ".rsrr" -type "double3" -2.6452191784224495e-014 1.0466890481559723e-014 
		-1.7493050748049344e-014 ;
	setAttr -k on ".w0";
createNode joint -n "ANM_L_clavicle_JNT" -p "ANM_spine2_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" -0.016132007799420478 0.78659730184944443 1.221941388389608 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -76.250917458599929 -90 0 ;
	setAttr ".bps" -type "matrix" 5.6644283774329237e-016 -3.2184988563713472e-016 -1.0000000000000004 0
		 -3.3306690738754701e-016 1.0000000000000002 -1.75061654326675e-016 0 1.0000000000000004 1.9428902930940239e-016 6.2840252499298757e-016 0
		 1.782144905238559 19.566550175866858 -1.2219413883896075 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_L_shoulder_JNT" -p "ANM_L_clavicle_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 4;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 4.706602733438673e-015 1.0182036531237233e-015 -4.3987053549955082 ;
	setAttr ".bps" -type "matrix" 0.020556650340710542 -0.078316967102822266 -0.99671654786633601 0
		 0.00077854007787639065 0.9969281604862178 -0.078317537658647601 0 0.99978838661094571 0.00083396245839756811 0.020554476507590277 0
		 0.35114274107283538 20.02247597841059 -4.3940544309050038 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_L_elbow_JNT" -p "ANM_L_shoulder_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" 4.0274932330323416 0.18455340648272056 -0.44478080535892311 ;
	setAttr ".r" -type "double3" 0.11437621851545217 2.5890948133674994 0.21994033436910951 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 4.6925272896462529 ;
	setAttr ".bps" -type "matrix" -0.024636459552706786 0.0072962229362282128 -0.99966985049643942 0
		 0.0010109730346144288 0.99997303655114034 0.0072735207578855307 0 0.99969596517852977 -0.00083144546241165919 -0.024643171553432552 0
		 -0.010608490348000377 19.890670480914757 -8.4319195876650461 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_L_wrist_JNT" -p "ANM_L_elbow_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 3.3572489402465528 -0.18509618328430119 0.43307604732316229 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -3.1156889362419622 ;
	setAttr ".bps" -type "matrix" -0.024654991192880359 -0.047065330488953262 -0.99858749545307512 0
		 -0.00032956797154293357 0.99889146725978639 -0.0470715202701536 0 0.99969596517852977 -0.00083144546241165919 -0.024643171553432552 0
		 0.33943803180156856 19.729714446067955 -11.800078802101838 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_L_hand_JNT" -p "ANM_L_wrist_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 7;
	setAttr ".t" -type "double3" 0.91521086438699917 -0.077633468193193805 -0.0036034131304154993 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 77.770647009000257 ;
	setAttr ".bps" -type "matrix" -0.0055446452130000403 0.96625448822704485 -0.25752965050757559 0
		 0.024025696977004241 0.25758799016944706 0.96595610314611857 0 0.99969596517852977 -0.00083144546241165919 -0.024643171553432552 0
		 0.31329678393776722 19.609095331358031 -12.710253802081846 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_L_thumb1_JNT" -p "ANM_L_hand_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".t" -type "double3" 0.94102488066337886 0.29847053014153269 0.12738552651631807 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -37.634307155790616 ;
	setAttr ".bps" -type "matrix" -0.019061496537673459 0.60791203840751773 -0.79377554315370635 0
		 0.015640861725401762 0.79400394347739878 0.60771136338464782 0 0.99969596517852977 -0.00083144546241165919 -0.024643171553432552 0
		 0.44259689423213516 20.595141355698306 -12.667425363901915 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_L_thumb2_JNT" -p "ANM_L_thumb1_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" 0.73642750578698324 0.0003185173538346179 0.023161004821148336 ;
	setAttr ".jo" -type "double3" 0 0 2.4047344882090154 ;
	setAttr ".bps" -type "matrix" -0.018388447727616337 0.64069167763078971 -0.76757803460287566 0
		 0.016426874198629409 0.76779781382411338 0.6404815960595398 0 0.99969596517852977 -0.00083144546241165919 -0.024643171553432552 0
		 0.45171842883540003 21.043058148803283 -13.252360701301104 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_L_thumb3_JNT" -p "ANM_L_thumb2_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 0.90103318856088277 0.00038075217441590716 0.023161004821148225 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -2.4047344882090185 ;
	setAttr ".bps" -type "matrix" -0.019061496537673455 0.60791203840751773 -0.79377554315370635 0
		 0.015640861725401765 0.79400394347739889 0.60771136338464782 0 0.99969596517852977 -0.00083144546241165919 -0.024643171553432552 0
		 0.4583100447839531 21.620615697558137 -13.944300881143413 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_L_fingerA1_JNT" -p "ANM_L_hand_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".t" -type "double3" 0.42397349582730443 -0.65690366521336552 -0.092690460224575361 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -64.643933538642912 ;
	setAttr ".bps" -type "matrix" -0.024085607569198132 0.18101811139755106 -0.98318478774546092 0
		 0.0052783249039312216 0.98347941109334225 0.18094304971924666 0 0.99969596517852977 -0.00083144546241165919 -0.024643171553432552 0
		 0.20250115382314071 19.849628196795781 -13.451695465965951 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_L_fingerA2_JNT" -p "ANM_L_fingerA1_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" 0.84911705038024765 -0.062229517682030389 0.012797058404320714 ;
	setAttr ".jo" -type "double3" 0 0 -0.21185123783486104 ;
	setAttr ".bps" -type "matrix" -0.024104959496411234 0.17738046556831522 -0.98384710263457331 0
		 0.005189232452419975 0.98414200150852782 0.17730649377093902 0 0.99969596517852977 -0.00083144546241165919 -0.024643171553432552 0
		 0.19451435380737975 19.942121672152386 -14.298109791732688 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_L_fingerA3_JNT" -p "ANM_L_fingerA2_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 1.042059164696707 0.00073208636073891092 0.14076764244752088 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 0.21185123783486079 ;
	setAttr ".bps" -type "matrix" -0.024085607569198128 0.18101811139755106 -0.98318478774546081 0
		 0.0052783249039312216 0.98347941109334214 0.18094304971924666 0 0.99969596517852977 -0.00083144546241165919 -0.024643171553432552 0
		 0.31012420299828319 20.127566048254785 -15.326675839189594 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_L_fingerB1_JNT" -p "ANM_L_hand_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".t" -type "double3" -0.20184749556034115 -0.86610446256733153 -0.092690460224575277 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -90.856331937934655 ;
	setAttr ".bps" -type "matrix" -0.023940147490666894 -0.27200014114703053 -0.96199937242917222 0
		 -0.0059030961277951911 0.96229685228334749 -0.27193734855967733 0 0.99969596517852977 -0.00083144546241165919 -0.024643171553432552 0
		 0.2009449142226592 19.191038242108519 -13.492606791760684 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_L_fingerB2_JNT" -p "ANM_L_fingerB1_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" 0.88011046274983185 -0.054229413530510209 0.012797058404320443 ;
	setAttr ".bps" -type "matrix" -0.023940147490666894 -0.27200014114703053 -0.96199937242917222 0
		 -0.0059030961277951911 0.96229685228334749 -0.27193734855967733 0 0.99969596517852977 -0.00083144546241165919 -0.024643171553432552 0
		 0.19298822903032684 18.899452638017863 -14.324840861770575 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_L_fingerB3_JNT" -p "ANM_L_fingerB2_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 0.94274160571279697 0.0028027984697867386 0.14076764244752096 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 90.856331937934655 ;
	setAttr ".bps" -type "matrix" -0.0055446452130000403 0.96625448822704463 -0.25752965050757548 0
		 0.024025696977004241 0.257587990169447 0.96595610314611835 0 0.99969596517852977 -0.00083144546241165919 -0.024643171553432552 0
		 0.31112715493766102 18.645606871726297 -15.235988841575583 1;
	setAttr ".radi" 0.5;
createNode ikEffector -n "ANM_L_effector1" -p "ANM_L_elbow_JNT";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode parentConstraint -n "ANM_L_shoulder_JNT_parentConstraint1" -p "ANM_L_shoulder_JNT";
	addAttr -ci true -k true -sn "w0" -ln "L_shoulder_CTLW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" -8.8817841970012523e-016 -3.5527136788005009e-015 
		1.27675647831893e-015 ;
	setAttr ".tg[0].tor" -type "double3" 0.044616496206988675 -1.1778922734043922 -4.4927828156923137 ;
	setAttr ".lr" -type "double3" 0.044616496206988675 -1.1778922734043924 -0.094077460696805337 ;
	setAttr ".rst" -type "double3" 3.1721130425153943 0.45592580254372095 -1.4310021641657249 ;
	setAttr ".rsrr" -type "double3" 0.044616496206988675 -1.1778922734043924 -0.094077460696805337 ;
	setAttr -k on ".w0";
createNode joint -n "ANM_R_clavicle_JNT" -p "ANM_spine2_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" -0.016132007799416925 0.78659730184944543 -1.2219999999999989 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -76.250917458599929 -90 0 ;
	setAttr ".bps" -type "matrix" 5.6644283774329237e-016 -3.2184988563713472e-016 -1.0000000000000004 0
		 -3.3306690738754701e-016 1.0000000000000002 -1.75061654326675e-016 0 1.0000000000000004 1.9428902930940239e-016 6.2840252499298757e-016 0
		 1.7821449052385576 19.566550175866865 1.2219999999999998 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_R_shoulder_JNT" -p "ANM_R_clavicle_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 4;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 2.8639142738458516e-016 4.3987053549955908 ;
	setAttr ".bps" -type "matrix" 5.3922930646120204e-016 0.076696498884737785 -0.99705448550158193 0
		 -1.361332092801655e-007 -0.99705448550157261 -0.076696498884737216 0 -0.99999999999999134 1.3573222711864937e-007 1.0440939934131318e-008 0
		 0.35114299999999909 20.022500000000022 4.3940500000000027 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_R_elbow_JNT" -p "ANM_R_shoulder_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" -4.0274995878401239 -0.18453867900157303 0.4447811000000001 ;
	setAttr ".r" -type "double3" -4.7637604568269562e-011 -1.0610831675098775e-009 -8.4269161697691534e-011 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 1.2074182697492533e-006 5.9242447492918327e-024 4.6925272896463301 ;
	setAttr ".bps" -type "matrix" -1.113685625827535e-008 -0.0051281376975152032 -0.99998685101543017 0
		 -1.5675032391677915e-007 -0.99998685101541773 0.0051281376975167419 0 -0.99999999999998823 1.5680537428037631e-007 1.0332872512789094e-008 0
		 -0.09363807487815673 19.897600060371143 8.4238400046439388 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_R_wrist_JNT" -p "ANM_R_elbow_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" -3.3572548292865605 0.18511889004937743 -0.43307610390108919 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 1.9108806861092654e-006 -5.9242447492918312e-024 -3.1156889362418898 ;
	setAttr ".bps" -type "matrix" -2.6006637718471494e-009 0.049230961764906107 -0.99878742102796991 0
		 -1.9047509208223656e-007 -0.99878742102795159 -0.049230961764904879 0 -0.99999999999998246 1.9011609295094472e-007 1.1974782175151936e-008 0
		 0.33943803739474582 19.729700001588768 11.782000000122217 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_R_hand_JNT" -p "ANM_R_wrist_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 7;
	setAttr ".t" -type "double3" -0.92353661016121236 0.07752741275754646 0.0035012888287024452 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 5.402704657695632e-006 3.0318914631415208e-006 77.770647009000143 ;
	setAttr ".bps" -type "matrix" -1.337871349472814e-007 -0.96569406712522166 -0.25968243821854892 0
		 -1.321008191541731e-007 -0.25968243821853171 0.96569406712522654 0 -0.9999999999999829 1.6350170542367277e-007 -9.2826807976144647e-008 0
		 0.33593673620081055 19.606800002064002 12.700600000158776 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_R_thumb1_JNT" -p "ANM_R_hand_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".t" -type "double3" -0.94177244551957084 -0.29549915213612249 -0.1274242361542626 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 7.4904463094196113e-006 -3.7412644997371746e-006 -37.634307155790445 ;
	setAttr ".bps" -type "matrix" -9.0583318242602531e-008 -0.60618931666715636 -0.79532038346731604 0
		 -3.1703980874586172e-007 -0.79532038346726175 0.60618931666715103 0 -0.99999999999994627 3.0705886219186731e-007 -1.2014338568145575e-007 0
		 0.46336113738778828 20.592999984768401 12.659799998828341 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_R_thumb2_JNT" -p "ANM_R_thumb1_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" -0.736861425573754 9.7470251283216403e-005 -0.023168048703514625 ;
	setAttr ".jo" -type "double3" 1.2412647844422111e-005 5.1787195570902763e-007 2.404734488208959 ;
	setAttr ".bps" -type "matrix" -1.0380597151599773e-007 -0.63902570844724194 -0.76918537683934851 0
		 -5.2960147240663788e-007 -0.76918537683920951 0.63902570844719786 0 -0.999999999999855 4.7369639275561125e-007 -2.5858292084262068e-007 0
		 0.48652925280775272 21.039599981623759 13.24589999858644 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_R_thumb3_JNT" -p "ANM_R_thumb2_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" -0.90149585114628239 -2.7279365413070375e-005 -0.023168040522504645 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 2.4785082598098663e-005 -5.2081252849461597e-007 -2.4047344882089585 ;
	setAttr ".bps" -type "matrix" -8.1493424834735263e-008 -0.60618931666715992 -0.79532038346731426 0
		 -9.6607189738837664e-007 -0.79532038346689793 0.60618931666694142 0 -0.9999999999995306 8.1773711554011382e-007 -5.2080908150157338e-007 0
		 0.50969738692535382 21.61569997847911 13.939299998344552 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_R_fingerA1_JNT" -p "ANM_R_hand_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".t" -type "double3" -0.42341465003819889 0.65460344263820203 0.092718579793075989 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 9.7187242771388851e-006 -5.5367475458294882e-006 -64.643933538642756 ;
	setAttr ".bps" -type "matrix" -3.4553045565383054e-008 -0.17888543819998284 -0.98386991009990721 0
		 -3.4709351001983983e-007 -0.98386991009984615 0.17888543819998384 0 -0.99999999999993971 3.4767589733536628e-007 -2.8094272864139486e-008 0
		 0.24321812658151809 19.845700014648905 13.442700001126839 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_R_fingerA2_JNT" -p "ANM_R_fingerA1_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" -0.8494643361083527 0.062261074007946289 -0.012800963733368457 ;
	setAttr ".jo" -type "double3" 1.2401862938154068e-005 -4.563654822853677e-008 -0.2118512378331357 ;
	setAttr ".bps" -type "matrix" -3.3269433476451613e-008 -0.17524636308177935 -0.98452461230108856 0
		 -5.636722386777372e-007 -0.98452461230092914 0.17524636308176994 0 -0.99999999999984113 5.6077953960640231e-007 -6.6026933765522604e-008 0
		 0.256019098056051 19.936400012911399 14.289600000993188 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_R_fingerA3_JNT" -p "ANM_R_fingerA2_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" -1.0454763170459267 1.6111734672301682e-005 -0.14081045437276477 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 2.4774236379414391e-005 4.5855803875850957e-008 0.21185123783141524 ;
	setAttr ".bps" -type "matrix" -3.535338032414204e-008 -0.17888543819995295 -0.98386991009991265 0
		 -9.9593736653844877e-007 -0.98386991009941871 0.17888543819989886 0 -0.99999999999950395 9.8619701235123634e-007 -1.4337556517367284e-007 0
		 0.39682958720211647 20.119599993798879 15.318899999522985 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_R_fingerB1_JNT" -p "ANM_R_hand_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".t" -type "double3" 0.20233400626084619 0.86377521210038544 0.092718557425021358 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 1.255032289550407e-005 -6.1263142108714417e-006 -90.856331937934627 ;
	setAttr ".bps" -type "matrix" 2.7161194175187341e-008 0.27408597963792886 -0.96170519171205315 0
		 -3.5084236895740441e-007 -0.96170519171199154 -0.27408597963792158 0 -0.9999999999999386 3.4485143035131117e-007 7.003991288084708e-008 0
		 0.24321803760069069 19.187100014648909 13.482200001126841 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_R_fingerB2_JNT" -p "ANM_R_fingerB1_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" -0.8804593754110337 0.054152174004001435 -0.012800962096376343 ;
	setAttr ".jo" -type "double3" 1.2547858734911258e-005 3.4827304193105462e-021 5.4743103174469634e-028 ;
	setAttr ".bps" -type "matrix" 2.7161194175187341e-008 0.27408597963792886 -0.96170519171205315 0
		 -5.6984381795671255e-007 -0.96170519171189295 -0.27408597963789971 0 -0.9999999999998378 5.5546626084640754e-007 1.300651395719511e-007 0
		 0.25601895678386116 18.893700012911406 14.314100000993196 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_R_fingerB3_JNT" -p "ANM_R_fingerB2_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" -0.94612845272188306 -0.0036607922686495852 -0.14081045193533206 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 5.0417900415766546e-005 2.5003819170225604e-005 90.856331937934755 ;
	setAttr ".bps" -type "matrix" -1.3378713494728159e-007 -0.96569406712522188 -0.25968243821854831 0
		 -8.9860006344203354e-007 -0.25968243821832931 0.96569406712487205 0 -0.99999999999958777 3.6254809807297126e-007 -8.330305806409244e-007 0
		 0.39682938510727161 18.637899993798897 15.224999999522996 1;
	setAttr ".radi" 0.5;
createNode ikEffector -n "ANM_L_effector2" -p "ANM_R_elbow_JNT";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -3.3572548292865623 0.18511889004938453 -0.43307610390108914 ;
	setAttr ".hd" yes;
createNode parentConstraint -n "ANM_R_shoulder_JNT_parentConstraint1" -p "ANM_R_shoulder_JNT";
	addAttr -ci true -k true -sn "w0" -ln "R_shoulder_CTLW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" 0 0 1.3322676295501878e-015 ;
	setAttr ".tg[0].tor" -type "double3" 180 1.3965416641188518e-014 4.3987053549955908 ;
	setAttr ".lr" -type "double3" -1.403341859706975e-014 -9.0982767931824394e-033 -7.9513867036587899e-016 ;
	setAttr ".rst" -type "double3" -3.1720500000000018 0.45594982413314605 -1.4310019052385576 ;
	setAttr ".rsrr" -type "double3" -1.403341859706975e-014 -9.0982767931824394e-033 
		-7.9513867036587899e-016 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "ANM_spine2_JNT_parentConstraint1" -p "ANM_spine2_JNT";
	addAttr -ci true -k true -sn "w0" -ln "breast_CTLW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" 3.4512664603419266e-031 -7.1054273576010019e-015 
		0 ;
	setAttr ".tg[0].tor" -type "double3" 89.999999999999972 13.749082541400083 90 ;
	setAttr ".lr" -type "double3" -2.7736357335331985e-014 1.9333762050047534e-014 1.5902773407317533e-015 ;
	setAttr ".rst" -type "double3" 3.4200636122724237 0.52310022607711537 2.2204460492503114e-016 ;
	setAttr ".rsrr" -type "double3" -2.7736357335331985e-014 1.9333762050047534e-014 
		1.5902773407317533e-015 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "ANM_spine1_JNT_parentConstraint1" -p "ANM_spine1_JNT";
	addAttr -ci true -k true -sn "w0" -ln "Spine_CTLW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" -2.9582283945787956e-031 3.5527136788005009e-015 
		-5.5511151231257827e-016 ;
	setAttr ".tg[0].tor" -type "double3" 89.999999999999972 1.1344551889577337 90.000000000000014 ;
	setAttr ".lr" -type "double3" -5.4811761850635833e-015 3.2072832463427727e-014 -1.5341168841758637e-030 ;
	setAttr ".rst" -type "double3" 3.5590723676166061 1.1383323917533787 -1.5900400000000019e-016 ;
	setAttr ".rsrr" -type "double3" 4.0928883287266196e-015 1.4381749626106463e-014 
		3.1805546814635176e-015 ;
	setAttr -k on ".w0";
createNode joint -n "ANM_L_thigh_JNT" -p "ANM_pelvis_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" -0.71371618524250735 -0.17289943243137618 -2.8484895926668266 ;
	setAttr ".r" -type "double3" -0.052920909687299934 0.0097278859651446989 0.00076715636282049041 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -151.6386049948907 ;
	setAttr ".bps" -type "matrix" 0.16545662948080064 -0.98621705264833559 -0.00016978363853430704 0
		 0.98621662023611156 0.16545671594672134 -0.00092364397255159604 0 0.0009390052795596683 -1.4620427628013694e-005 0.99999955902756699 0
		 0.42027724464006389 11.498213947345427 -2.848489592666827 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_L_kne_JNT" -p "ANM_L_thigh_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 5.2251490345599754 -0.033112070886522904 -8.8817841970012523e-016 ;
	setAttr ".r" -type "double3" 4.3578610280175713e-019 1.3335531221351612e-018 0.0012674638446162519 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 180 1.7655625192200645e-031 -24.661834884872391 ;
	setAttr ".bps" -type "matrix" -0.26116717174095566 -0.96529355896862767 0.00023112445041319565 0
		 -0.96529312992163996 0.2611672736005114 0.00091023412392980695 0 -0.00093900527955978648 1.4620427628045674e-005 -0.99999955902756699 0
		 1.2521571177944917 6.3396042523263123 -2.8493461537171063 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_L_ankle_JNT" -p "ANM_L_kne_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" 4.4629705516466309 -0.19219293746863969 -1.3322676295501878e-015 ;
	setAttr ".r" -type "double3" 0.044909848097438004 -0.029637141298375618 -0.16345051461383289 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 180 7.293985666707293e-015 -47.832575729296927 ;
	setAttr ".bps" -type "matrix" 0.5377382070946618 -0.84311186721016995 1.9487230839415615e-012 0
		 0.84311186721017028 0.53773820709466191 -1.2821812838889612e-012 0 3.3180706446311881e-014 2.3325050522776322e-012 1.0000000000000002 0
		 0.27209824341570577 1.9813330194711982 -2.8484895926712075 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_L_ball_JNT" -p "ANM_L_ankle_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" 3.3008935566004065 1.4975401011280085 1.4863374141294276e-015 ;
	setAttr ".r" -type "double3" 9.6325496207135617e-016 2.9505918847192035e-012 0.039204104519091829 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -2.3606876156458488e-015 -4.3203499057149944e-015 
		57.305373853835981 ;
	setAttr ".bps" -type "matrix" 0.99999759647628594 -0.002192496671037214 -2.8005388030910974e-014 0
		 0.0021924966710375471 0.99999759647628572 -2.3325364307729674e-012 0 3.3180706446311881e-014 2.3325050522776322e-012 1.0000000000000002 0
		 3.3097086572364729 0.0035950185367445986 -2.8484895926666938 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_L_toe_JNT" -p "ANM_L_ball_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" 1.6846309758415936 1.4578127656212214e-005 8.8817841970012523e-016 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -179.99999999999997 5.9118609695590769e-015 162.24655499007392 ;
	setAttr ".bps" -type "matrix" -0.95170663884382711 0.30700891449693501 -6.8456895359678788e-013 0
		 0.3070089144969354 0.951706638843827 -2.2305611391776426e-012 0 -3.3354643541012586e-014 -2.3330442453757841e-012 -1.0000000000000002 0
		 4.9943356159900629 -8.3951177096931815e-005 -2.84848959266674 1;
	setAttr ".radi" 0.5;
createNode ikEffector -n "effector2" -p "ANM_L_ball_JNT";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode ikEffector -n "effector1" -p "ANM_L_ankle_JNT";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode ikEffector -n "ANM_L_effector1" -p "ANM_L_kne_JNT";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode joint -n "ANM_R_thigh_JNT" -p "ANM_pelvis_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" -0.71371618524250735 -0.17289943243137529 2.8480000000000008 ;
	setAttr ".r" -type "double3" -0.1020470923494793 -0.015114232705819746 0.00045972739778382178 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -151.63860499540664 ;
	setAttr ".bps" -type "matrix" 0.16545133440439608 -0.98621792031832078 0.00026379312157004918 0
		 0.98621646814281994 0.16545061438615327 -0.0017810567499808789 0 0.0017128653499005055 0.00055483533660951267 0.99999837912370781 0
		 0.420277244640063 11.498213947345429 2.8480000000000012 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_R_kne_JNT" -p "ANM_R_thigh_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 5.2251490345575728 -0.033112071266125032 0 ;
	setAttr ".r" -type "double3" 1.3300131265341105e-019 2.1852868364621735e-019 0.0006210253029025097 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 180 0 -24.661834884872437 ;
	setAttr ".bps" -type "matrix" -0.26116102942780139 -0.96529474803631643 0.0009829149076887719 0
		 -0.96529372876886799 0.26116228971896738 0.0015085185586805573 0 -0.0017128653499006237 -0.00055483533660948068 -0.99999837912370781 0
		 1.2521294548924842 6.339599920596199 2.8494373328525304 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_R_ankle_JNT" -p "ANM_R_kne_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" 4.4629705516736404 -0.19219293723639569 -8.8817841970012523e-016 ;
	setAttr ".r" -type "double3" 0.09976254215985253 -0.026256270243196742 -3.3611120263830531e-005 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 180 0 -47.832575729296927 ;
	setAttr ".bps" -type "matrix" 0.5401455900163481 -0.84157159029157558 -4.6594696808581818e-009 0
		 0.8415715902915758 0.5401455900163481 -6.9085118496129555e-009 0 8.330799364806088e-009 -1.8967506417496421e-010 1.0000000000000004 0
		 0.27209810833939496 1.9813243388684212 2.8535341265276788 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_R_ball_JNT" -p "ANM_R_ankle_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" 3.3112769501039478 1.490875810459942 2.0689465252132777e-008 ;
	setAttr ".r" -type "double3" -2.5026697941465614e-006 -2.1656935443168431e-011 -5.3600494169973606e-014 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 57.305373853835981 ;
	setAttr ".bps" -type "matrix" 0.99999999982372423 -1.8776382322616136e-005 -8.3308028637010701e-009 0
		 1.877638232236327e-005 0.99999999982372301 -4.3490309320281346e-008 0 8.3316195139563626e-009 4.3490152926191521e-008 0.99999999999999944 0
		 3.3153484769968409 -6.227564440974831e-005 2.8535341214886163 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_R_toe_JNT" -p "ANM_R_ball_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" 1.6846309758415954 1.4578009601075887e-005 3.6080608722954828e-008 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -179.99999999999997 7.0622500768802582e-031 162.24655499007392 ;
	setAttr ".bps" -type "matrix" -0.95237174192563856 0.30493944510595217 -5.3270641585064046e-009 0
		 0.30493944510595233 0.95237174192563723 -4.3959432644081427e-008 0 -8.331619686720991e-009 -4.3490153465761435e-008 -0.99999999999999944 0
		 4.9999794528151993 -7.9328910084596737e-005 2.8535341435342625 1;
	setAttr ".radi" 0.5;
createNode ikEffector -n "effector4" -p "ANM_R_ball_JNT";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode ikEffector -n "effector3" -p "ANM_R_ankle_JNT";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode ikEffector -n "ANM_R_effector1" -p "ANM_R_kne_JNT";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode parentConstraint -n "ANM_pelvis_JNT_parentConstraint1" -p "ANM_pelvis_JNT";
	addAttr -ci true -k true -sn "w0" -ln "pelvis_CTLW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" -1.4248023943560094e-016 0 4.4408920985006262e-016 ;
	setAttr ".tg[0].tor" -type "double3" -90 -18.838400000000011 90 ;
	setAttr ".lr" -type "double3" -4.4139062980501586e-031 -1.5902773407317584e-014 
		3.1805546814635168e-015 ;
	setAttr ".rst" -type "double3" -0.75881200000000959 -0.9978550000000026 1.5900399999999999e-016 ;
	setAttr ".rsrr" -type "double3" 6.3611093629270335e-015 -3.1805546814635176e-015 
		9.5416640443905503e-015 ;
	setAttr -k on ".w0";
createNode transform -n "back";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.12705785457145147 22.096304140462564 -100.1 ;
	setAttr ".r" -type "double3" 0 180 0 ;
createNode camera -n "backShape" -p "back";
	setAttr -k off ".v";
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 35.000176402727362;
	setAttr ".imn" -type "string" "back1";
	setAttr ".den" -type "string" "back1_depth";
	setAttr ".man" -type "string" "back1_mask";
	setAttr ".hc" -type "string" "viewSet -b %camera";
	setAttr ".o" yes;
createNode mentalrayItemsList -s -n "mentalrayItemsList";
createNode mentalrayGlobals -s -n "mentalrayGlobals";
createNode mentalrayOptions -s -n "miDefaultOptions";
	addAttr -ci true -m -sn "stringOptions" -ln "stringOptions" -at "compound" -nc 
		3;
	addAttr -ci true -sn "name" -ln "name" -dt "string" -p "stringOptions";
	addAttr -ci true -sn "value" -ln "value" -dt "string" -p "stringOptions";
	addAttr -ci true -sn "type" -ln "type" -dt "string" -p "stringOptions";
	setAttr -s 45 ".stringOptions";
	setAttr ".stringOptions[0].name" -type "string" "rast motion factor";
	setAttr ".stringOptions[0].value" -type "string" "1.0";
	setAttr ".stringOptions[0].type" -type "string" "scalar";
	setAttr ".stringOptions[1].name" -type "string" "rast transparency depth";
	setAttr ".stringOptions[1].value" -type "string" "8";
	setAttr ".stringOptions[1].type" -type "string" "integer";
	setAttr ".stringOptions[2].name" -type "string" "rast useopacity";
	setAttr ".stringOptions[2].value" -type "string" "true";
	setAttr ".stringOptions[2].type" -type "string" "boolean";
	setAttr ".stringOptions[3].name" -type "string" "importon";
	setAttr ".stringOptions[3].value" -type "string" "false";
	setAttr ".stringOptions[3].type" -type "string" "boolean";
	setAttr ".stringOptions[4].name" -type "string" "importon density";
	setAttr ".stringOptions[4].value" -type "string" "1.0";
	setAttr ".stringOptions[4].type" -type "string" "scalar";
	setAttr ".stringOptions[5].name" -type "string" "importon merge";
	setAttr ".stringOptions[5].value" -type "string" "0.0";
	setAttr ".stringOptions[5].type" -type "string" "scalar";
	setAttr ".stringOptions[6].name" -type "string" "importon trace depth";
	setAttr ".stringOptions[6].value" -type "string" "0";
	setAttr ".stringOptions[6].type" -type "string" "integer";
	setAttr ".stringOptions[7].name" -type "string" "importon traverse";
	setAttr ".stringOptions[7].value" -type "string" "true";
	setAttr ".stringOptions[7].type" -type "string" "boolean";
	setAttr ".stringOptions[8].name" -type "string" "shadowmap pixel samples";
	setAttr ".stringOptions[8].value" -type "string" "3";
	setAttr ".stringOptions[8].type" -type "string" "integer";
	setAttr ".stringOptions[9].name" -type "string" "ambient occlusion";
	setAttr ".stringOptions[9].value" -type "string" "false";
	setAttr ".stringOptions[9].type" -type "string" "boolean";
	setAttr ".stringOptions[10].name" -type "string" "ambient occlusion rays";
	setAttr ".stringOptions[10].value" -type "string" "256";
	setAttr ".stringOptions[10].type" -type "string" "integer";
	setAttr ".stringOptions[11].name" -type "string" "ambient occlusion cache";
	setAttr ".stringOptions[11].value" -type "string" "false";
	setAttr ".stringOptions[11].type" -type "string" "boolean";
	setAttr ".stringOptions[12].name" -type "string" "ambient occlusion cache density";
	setAttr ".stringOptions[12].value" -type "string" "1.0";
	setAttr ".stringOptions[12].type" -type "string" "scalar";
	setAttr ".stringOptions[13].name" -type "string" "ambient occlusion cache points";
	setAttr ".stringOptions[13].value" -type "string" "64";
	setAttr ".stringOptions[13].type" -type "string" "integer";
	setAttr ".stringOptions[14].name" -type "string" "irradiance particles";
	setAttr ".stringOptions[14].value" -type "string" "false";
	setAttr ".stringOptions[14].type" -type "string" "boolean";
	setAttr ".stringOptions[15].name" -type "string" "irradiance particles rays";
	setAttr ".stringOptions[15].value" -type "string" "256";
	setAttr ".stringOptions[15].type" -type "string" "integer";
	setAttr ".stringOptions[16].name" -type "string" "irradiance particles interpolate";
	setAttr ".stringOptions[16].value" -type "string" "1";
	setAttr ".stringOptions[16].type" -type "string" "integer";
	setAttr ".stringOptions[17].name" -type "string" "irradiance particles interppoints";
	setAttr ".stringOptions[17].value" -type "string" "64";
	setAttr ".stringOptions[17].type" -type "string" "integer";
	setAttr ".stringOptions[18].name" -type "string" "irradiance particles indirect passes";
	setAttr ".stringOptions[18].value" -type "string" "0";
	setAttr ".stringOptions[18].type" -type "string" "integer";
	setAttr ".stringOptions[19].name" -type "string" "irradiance particles scale";
	setAttr ".stringOptions[19].value" -type "string" "1.0";
	setAttr ".stringOptions[19].type" -type "string" "scalar";
	setAttr ".stringOptions[20].name" -type "string" "irradiance particles env";
	setAttr ".stringOptions[20].value" -type "string" "true";
	setAttr ".stringOptions[20].type" -type "string" "boolean";
	setAttr ".stringOptions[21].name" -type "string" "irradiance particles env rays";
	setAttr ".stringOptions[21].value" -type "string" "256";
	setAttr ".stringOptions[21].type" -type "string" "integer";
	setAttr ".stringOptions[22].name" -type "string" "irradiance particles env scale";
	setAttr ".stringOptions[22].value" -type "string" "1";
	setAttr ".stringOptions[22].type" -type "string" "integer";
	setAttr ".stringOptions[23].name" -type "string" "irradiance particles rebuild";
	setAttr ".stringOptions[23].value" -type "string" "true";
	setAttr ".stringOptions[23].type" -type "string" "boolean";
	setAttr ".stringOptions[24].name" -type "string" "irradiance particles file";
	setAttr ".stringOptions[24].value" -type "string" "";
	setAttr ".stringOptions[24].type" -type "string" "string";
	setAttr ".stringOptions[25].name" -type "string" "geom displace motion factor";
	setAttr ".stringOptions[25].value" -type "string" "1.0";
	setAttr ".stringOptions[25].type" -type "string" "scalar";
	setAttr ".stringOptions[26].name" -type "string" "contrast all buffers";
	setAttr ".stringOptions[26].value" -type "string" "true";
	setAttr ".stringOptions[26].type" -type "string" "boolean";
	setAttr ".stringOptions[27].name" -type "string" "finalgather normal tolerance";
	setAttr ".stringOptions[27].value" -type "string" "25.842";
	setAttr ".stringOptions[27].type" -type "string" "scalar";
	setAttr ".stringOptions[28].name" -type "string" "trace camera clip";
	setAttr ".stringOptions[28].value" -type "string" "false";
	setAttr ".stringOptions[28].type" -type "string" "boolean";
	setAttr ".stringOptions[29].name" -type "string" "unified sampling";
	setAttr ".stringOptions[29].value" -type "string" "true";
	setAttr ".stringOptions[29].type" -type "string" "boolean";
	setAttr ".stringOptions[30].name" -type "string" "samples quality";
	setAttr ".stringOptions[30].value" -type "string" "0.25 0.25 0.25 0.25";
	setAttr ".stringOptions[30].type" -type "string" "color";
	setAttr ".stringOptions[31].name" -type "string" "samples min";
	setAttr ".stringOptions[31].value" -type "string" "1.0";
	setAttr ".stringOptions[31].type" -type "string" "scalar";
	setAttr ".stringOptions[32].name" -type "string" "samples max";
	setAttr ".stringOptions[32].value" -type "string" "100.0";
	setAttr ".stringOptions[32].type" -type "string" "scalar";
	setAttr ".stringOptions[33].name" -type "string" "samples error cutoff";
	setAttr ".stringOptions[33].value" -type "string" "0.0 0.0 0.0 0.0";
	setAttr ".stringOptions[33].type" -type "string" "color";
	setAttr ".stringOptions[34].name" -type "string" "samples per object";
	setAttr ".stringOptions[34].value" -type "string" "false";
	setAttr ".stringOptions[34].type" -type "string" "boolean";
	setAttr ".stringOptions[35].name" -type "string" "progressive";
	setAttr ".stringOptions[35].value" -type "string" "false";
	setAttr ".stringOptions[35].type" -type "string" "boolean";
	setAttr ".stringOptions[36].name" -type "string" "progressive max time";
	setAttr ".stringOptions[36].value" -type "string" "0";
	setAttr ".stringOptions[36].type" -type "string" "integer";
	setAttr ".stringOptions[37].name" -type "string" "progressive subsampling size";
	setAttr ".stringOptions[37].value" -type "string" "1";
	setAttr ".stringOptions[37].type" -type "string" "integer";
	setAttr ".stringOptions[38].name" -type "string" "iray";
	setAttr ".stringOptions[38].value" -type "string" "false";
	setAttr ".stringOptions[38].type" -type "string" "boolean";
	setAttr ".stringOptions[39].name" -type "string" "light relative scale";
	setAttr ".stringOptions[39].value" -type "string" "0.31831";
	setAttr ".stringOptions[39].type" -type "string" "scalar";
	setAttr ".stringOptions[40].name" -type "string" "trace camera motion vectors";
	setAttr ".stringOptions[40].value" -type "string" "false";
	setAttr ".stringOptions[40].type" -type "string" "boolean";
	setAttr ".stringOptions[41].name" -type "string" "ray differentials";
	setAttr ".stringOptions[41].value" -type "string" "true";
	setAttr ".stringOptions[41].type" -type "string" "boolean";
	setAttr ".stringOptions[42].name" -type "string" "environment lighting mode";
	setAttr ".stringOptions[42].value" -type "string" "off";
	setAttr ".stringOptions[42].type" -type "string" "string";
	setAttr ".stringOptions[43].name" -type "string" "environment lighting quality";
	setAttr ".stringOptions[43].value" -type "string" "0.167";
	setAttr ".stringOptions[43].type" -type "string" "scalar";
	setAttr ".stringOptions[44].name" -type "string" "environment lighting shadow";
	setAttr ".stringOptions[44].value" -type "string" "transparent";
	setAttr ".stringOptions[44].type" -type "string" "string";
createNode mentalrayFramebuffer -s -n "miDefaultFramebuffer";
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 29 ".lnk";
	setAttr -s 29 ".slnk";
createNode displayLayerManager -n "layerManager";
	setAttr ".cdl" 6;
	setAttr -s 6 ".dli[1:5]"  1 5 2 3 6;
	setAttr -s 3 ".dli";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
	setAttr ".g" yes;
createNode ikRPsolver -n "ikRPsolver";
createNode script -n "uiConfigurationScriptNode";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"top\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n"
		+ "                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 1\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n"
		+ "                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n"
		+ "                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 1\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n"
		+ "            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 0\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n"
		+ "            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"front\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 1\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n"
		+ "                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n"
		+ "                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n"
		+ "                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 1\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n"
		+ "            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 0\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n"
		+ "            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"front\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 1\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n"
		+ "                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n"
		+ "                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n"
		+ "                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 1\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n"
		+ "            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 0\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n"
		+ "            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n"
		+ "        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 1\n                -activeComponentsXray 0\n"
		+ "                -displayTextures 1\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n"
		+ "                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n"
		+ "                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n"
		+ "            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 1\n            -activeComponentsXray 0\n            -displayTextures 1\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n"
		+ "            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n"
		+ "            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            outlinerEditor -e \n                -showShapes 0\n                -showReferenceNodes 1\n                -showReferenceMembers 1\n                -showAttributes 0\n                -showConnected 0\n                -showAnimCurvesOnly 0\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n"
		+ "                -autoExpand 0\n                -showDagOnly 1\n                -showAssets 1\n                -showContainedOnly 1\n                -showPublishedAsConnected 0\n                -showContainerContents 1\n                -ignoreDagHierarchy 0\n                -expandConnections 0\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 0\n                -highlightActive 1\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"defaultSetFilter\" \n                -showSetMembers 1\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n"
		+ "                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n"
		+ "            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n"
		+ "            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"graphEditor\" -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n"
		+ "                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n"
		+ "                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n"
		+ "                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n"
		+ "                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n"
		+ "                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n"
		+ "                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dopeSheetPanel\" -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n"
		+ "                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n"
		+ "                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n"
		+ "                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n"
		+ "                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"clipEditorPanel\" -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n"
		+ "                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"sequenceEditorPanel\" -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 1\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n"
		+ "                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 1\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n"
		+ "                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperShadePanel\" -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"visorPanel\" -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n"
		+ "            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -defaultPinnedState 0\n                -ignoreAssets 1\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -keyReleaseCommand \"nodeEdKeyReleaseCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -island 0\n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -syncedSelection 1\n                -extendToShapes 1\n                $editorName;;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -defaultPinnedState 0\n                -ignoreAssets 1\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -keyReleaseCommand \"nodeEdKeyReleaseCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -island 0\n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -syncedSelection 1\n                -extendToShapes 1\n                $editorName;;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"createNodePanel\" -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Texture Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"polyTexturePlacementPanel\" -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"renderWindowPanel\" -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"blendShapePanel\" (localizedPanelLabel(\"Blend Shape\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\tblendShapePanel -unParent -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels ;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tblendShapePanel -edit -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynRelEdPanel\" -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"relationshipPanel\" -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"referenceEditorPanel\" -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"componentEditorPanel\" -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynPaintScriptedPanelType\" -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"scriptEditorPanel\" -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-defaultImage \"\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"vertical2\\\" -ps 1 20 100 -ps 2 80 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Outliner\")) \n\t\t\t\t\t\"outlinerPanel\"\n\t\t\t\t\t\"$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\\\"Outliner\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\noutlinerEditor -e \\n    -showShapes 0\\n    -showReferenceNodes 1\\n    -showReferenceMembers 1\\n    -showAttributes 0\\n    -showConnected 0\\n    -showAnimCurvesOnly 0\\n    -showMuteInfo 0\\n    -organizeByLayer 1\\n    -showAnimLayerWeight 1\\n    -autoExpandLayers 1\\n    -autoExpand 0\\n    -showDagOnly 1\\n    -showAssets 1\\n    -showContainedOnly 1\\n    -showPublishedAsConnected 0\\n    -showContainerContents 1\\n    -ignoreDagHierarchy 0\\n    -expandConnections 0\\n    -showUpstreamCurves 1\\n    -showUnitlessCurves 1\\n    -showCompounds 1\\n    -showLeafs 1\\n    -showNumericAttrsOnly 0\\n    -highlightActive 1\\n    -autoSelectNewObjects 0\\n    -doNotSelectNewObjects 0\\n    -dropIsParent 1\\n    -transmitFilters 0\\n    -setFilter \\\"defaultSetFilter\\\" \\n    -showSetMembers 1\\n    -allowMultiSelection 1\\n    -alwaysToggleSelect 0\\n    -directSelect 0\\n    -displayMode \\\"DAG\\\" \\n    -expandObjects 0\\n    -setsIgnoreFilters 1\\n    -containersIgnoreFilters 0\\n    -editAttrName 0\\n    -showAttrValues 0\\n    -highlightSecondary 0\\n    -showUVAttrsOnly 0\\n    -showTextureNodesOnly 0\\n    -attrAlphaOrder \\\"default\\\" \\n    -animLayerFilterOptions \\\"allAffecting\\\" \\n    -sortOrder \\\"none\\\" \\n    -longNames 0\\n    -niceNames 1\\n    -showNamespace 1\\n    -showPinIcons 0\\n    -mapMotionTrails 0\\n    $editorName\"\n"
		+ "\t\t\t\t\t\"outlinerPanel -edit -l (localizedPanelLabel(\\\"Outliner\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\noutlinerEditor -e \\n    -showShapes 0\\n    -showReferenceNodes 1\\n    -showReferenceMembers 1\\n    -showAttributes 0\\n    -showConnected 0\\n    -showAnimCurvesOnly 0\\n    -showMuteInfo 0\\n    -organizeByLayer 1\\n    -showAnimLayerWeight 1\\n    -autoExpandLayers 1\\n    -autoExpand 0\\n    -showDagOnly 1\\n    -showAssets 1\\n    -showContainedOnly 1\\n    -showPublishedAsConnected 0\\n    -showContainerContents 1\\n    -ignoreDagHierarchy 0\\n    -expandConnections 0\\n    -showUpstreamCurves 1\\n    -showUnitlessCurves 1\\n    -showCompounds 1\\n    -showLeafs 1\\n    -showNumericAttrsOnly 0\\n    -highlightActive 1\\n    -autoSelectNewObjects 0\\n    -doNotSelectNewObjects 0\\n    -dropIsParent 1\\n    -transmitFilters 0\\n    -setFilter \\\"defaultSetFilter\\\" \\n    -showSetMembers 1\\n    -allowMultiSelection 1\\n    -alwaysToggleSelect 0\\n    -directSelect 0\\n    -displayMode \\\"DAG\\\" \\n    -expandObjects 0\\n    -setsIgnoreFilters 1\\n    -containersIgnoreFilters 0\\n    -editAttrName 0\\n    -showAttrValues 0\\n    -highlightSecondary 0\\n    -showUVAttrsOnly 0\\n    -showTextureNodesOnly 0\\n    -attrAlphaOrder \\\"default\\\" \\n    -animLayerFilterOptions \\\"allAffecting\\\" \\n    -sortOrder \\\"none\\\" \\n    -longNames 0\\n    -niceNames 1\\n    -showNamespace 1\\n    -showPinIcons 0\\n    -mapMotionTrails 0\\n    $editorName\"\n"
		+ "\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 1\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 1\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 24 -ast 1 -aet 25 ";
	setAttr ".st" 6;
createNode ikRPsolver -n "ikRPsolver1";
createNode animCurveUA -n "R_invToe_JNT_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  -10 45 -5 0 0 0 5 0;
createNode animCurveUA -n "R_invBall_JNT_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -5 29.999999999999996 0 0 5 0;
createNode animCurveUA -n "R_invHeel_JNT_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 5 50;
createNode animCurveUA -n "L_invHeel_JNT_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 5 50;
createNode animCurveUA -n "L_invToe_JNT_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -10 29.999999999999996 -5 0 0 0;
createNode animCurveUA -n "L_invBall_JNT_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  -5 45 0 0;
createNode makeNurbCircle -n "makeNurbCircle6";
	setAttr ".nr" -type "double3" 0 1 0 ;
	setAttr ".r" 17.07645203471434;
createNode animCurveUA -n "ANM_L_wrist_JNT_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  -10 70 -5 35 0 0 10 -70;
createNode animCurveUA -n "ANM_L_thumb1_JNT_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 -90;
createNode animCurveUA -n "ANM_L_thumb1_JNT_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveUA -n "ANM_L_thumb2_JNT_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 -40;
createNode animCurveUA -n "ANM_L_fingerA1_JNT_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 -50;
createNode animCurveUA -n "ANM_L_fingerA2_JNT_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 -50;
createNode animCurveUA -n "ANM_L_fingerB1_JNT_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 -50;
createNode animCurveUA -n "ANM_L_fingerB2_JNT_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 -50;
createNode animCurveUU -n "L_wrist_IK_ikBlend";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 1 1;
createNode animCurveUA -n "ANM_R_wrist_JNT_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -10 70 0 0 10 -70;
createNode animCurveUA -n "ANM_R_thumb1_JNT_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 -90;
createNode animCurveUA -n "ANM_R_thumb2_JNT_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 -40;
createNode animCurveUA -n "ANM_R_fingerA1_JNT_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 -50;
createNode animCurveUA -n "ANM_R_fingerA2_JNT_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 -50;
createNode animCurveUA -n "ANM_R_fingerB1_JNT_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 -50;
createNode animCurveUA -n "ANM_R_fingerB2_JNT_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 -50;
createNode shadingEngine -n "baldr1:wire_224198087";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "baldr1:materialInfo1";
createNode phong -n "baldr1:wire_224198088";
	setAttr ".c" -type "float3" 0.87840003 0.77649999 0.34119999 ;
	setAttr ".ambc" -type "float3" 0.87840003 0.77649999 0.34119999 ;
	setAttr ".sc" -type "float3" 0.34999999 0.34999999 0.34999999 ;
	setAttr ".cp" 34;
createNode shadingEngine -n "baldr1:default1";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "baldr1:materialInfo2";
createNode phong -n "baldr1:default2";
	setAttr ".rfi" 1.5;
	setAttr ".c" -type "float3" 0.588 0.588 0.588 ;
	setAttr ".ambc" -type "float3" 0.588 0.588 0.588 ;
	setAttr ".sc" -type "float3" 0 0 0 ;
	setAttr ".cp" 12;
createNode lambert -n "lambert2";
createNode shadingEngine -n "lambert2SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
createNode file -n "file1";
	setAttr ".ftn" -type "string" "F:/Ygg/BaldrDiffuse.tga";
createNode place2dTexture -n "place2dTexture1";
createNode lambert -n "lambert3";
createNode shadingEngine -n "lambert3SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo2";
createNode file -n "file2";
	setAttr ".ftn" -type "string" "C:/Users/Cyrain/Documents/DownhillMadness/Art/Character/Emily/Balder/Baldr_diff.png";
createNode place2dTexture -n "place2dTexture2";
createNode displayLayer -n "rigg";
	setAttr ".dt" 2;
	setAttr ".do" 1;
createNode shadingEngine -n "balder:default1";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "balder:materialInfo1";
createNode phong -n "balder:default2";
	setAttr ".rfi" 1.5;
	setAttr ".c" -type "float3" 0.588 0.588 0.588 ;
	setAttr ".ambc" -type "float3" 0.588 0.588 0.588 ;
	setAttr ".sc" -type "float3" 0 0 0 ;
	setAttr ".cp" 12;
createNode displayLayer -n "cons";
	setAttr ".do" 2;
createNode blindDataTemplate -n "blindDataTemplate1";
	addAttr -ci true -sn "MaxVisibility" -ln "MaxVisibility" -min 0 -max 1 -at "bool";
	setAttr ".tid" 16180;
createNode phong -n "FBXASC0482FBXASC032FBXASC045FBXASC032Default";
	addAttr -is true -ci true -k true -sn "aktiviert" -ln "aktiviert" -min 0 -max 1 
		-at "bool";
	addAttr -is true -ci true -k true -sn "Effektliste" -ln "Effektliste" -smn 0 -smx 
		0 -at "long";
	setAttr ".dc" 1;
	setAttr ".ambc" -type "float3" 0.58823532 0.58823532 0.58823532 ;
	setAttr ".sc" -type "float3" 0 0 0 ;
	setAttr ".rfl" 1;
	setAttr ".cp" 2;
createNode shadingEngine -n "Objekt003SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo3";
createNode shadingEngine -n "Objekt003SG1";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo4";
createNode file -n "MapFBXASC032FBXASC0353";
	setAttr ".ftn" -type "string" "C:/Users/Cyrain/Desktop/Baldr_diff.png";
createNode place2dTexture -n "place2dTexture3";
createNode phong -n "FBXASC0482FBXASC032FBXASC045FBXASC032Default1";
	addAttr -is true -ci true -k true -sn "aktiviert" -ln "aktiviert" -min 0 -max 1 
		-at "bool";
	addAttr -is true -ci true -k true -sn "Effektliste" -ln "Effektliste" -smn 0 -smx 
		0 -at "long";
	setAttr ".dc" 1;
	setAttr ".ambc" -type "float3" 0.58823532 0.58823532 0.58823532 ;
	setAttr ".sc" -type "float3" 0 0 0 ;
	setAttr ".rfl" 1;
	setAttr ".cp" 2;
createNode shadingEngine -n "Objekt003SG2";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo5";
createNode shadingEngine -n "Objekt003SG3";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo6";
createNode animCurveTL -n "L_foot_CTL_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "L_foot_CTL_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 24 3.732;
createNode animCurveTL -n "L_foot_CTL_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 24 3.803;
createNode animCurveTA -n "L_foot_CTL_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTA -n "L_foot_CTL_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTA -n "L_foot_CTL_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTU -n "L_foot_CTL_footRoll";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "R_foot_CTL_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "R_foot_CTL_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 24 3.732;
createNode animCurveTL -n "R_foot_CTL_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 24 3.803;
createNode animCurveTA -n "R_foot_CTL_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTA -n "R_foot_CTL_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTA -n "R_foot_CTL_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTU -n "R_foot_CTL_footRoll";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "L_knee_CTL_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "R_knee_CTL_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "pelvis_CTL_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "pelvis_CTL_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "pelvis_CTL_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTA -n "pelvis_CTL_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTA -n "pelvis_CTL_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTA -n "pelvis_CTL_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "Spine_CTL_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "Spine_CTL_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 3.5527136788005009e-015;
createNode animCurveTL -n "Spine_CTL_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 24 -0.675;
createNode animCurveTA -n "Spine_CTL_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 24 2.834;
createNode animCurveTA -n "Spine_CTL_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTA -n "Spine_CTL_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTA -n "breast_CTL_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTA -n "breast_CTL_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTA -n "breast_CTL_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "L_shoulder_CTL_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "L_shoulder_CTL_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "L_shoulder_CTL_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTA -n "L_shoulder_CTL_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 24 90;
createNode animCurveTA -n "L_shoulder_CTL_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 24 -80;
createNode animCurveTA -n "L_shoulder_CTL_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 24 -90;
createNode animCurveTL -n "R_shoulder_CTL_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "R_shoulder_CTL_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "R_shoulder_CTL_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTA -n "R_shoulder_CTL_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 24 -90;
createNode animCurveTA -n "R_shoulder_CTL_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 24 100;
createNode animCurveTA -n "R_shoulder_CTL_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 24 -90;
createNode animCurveTL -n "R_wrist_CTL_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 24 1;
createNode animCurveTL -n "R_wrist_CTL_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "R_wrist_CTL_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTA -n "R_wrist_CTL_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTA -n "R_wrist_CTL_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTA -n "R_wrist_CTL_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTU -n "R_wrist_CTL_wristCurl";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 24 -2;
createNode animCurveTU -n "R_wrist_CTL_Finger_A_Curl";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 24 10;
createNode animCurveTU -n "R_wrist_CTL_Finger_B_Curl";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 24 10;
createNode animCurveTU -n "R_wrist_CTL_ThumbCurl";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 24 10;
createNode animCurveTA -n "head_CTL_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTA -n "head_CTL_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTA -n "head_CTL_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "L_wrist_CTL_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 24 -1;
createNode animCurveTL -n "L_wrist_CTL_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 24 0;
createNode animCurveTL -n "L_wrist_CTL_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 2.1710069140379454e-015;
createNode animCurveTA -n "L_wrist_CTL_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTA -n "L_wrist_CTL_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTA -n "L_wrist_CTL_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTU -n "L_wrist_CTL_wristCurl";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 24 -2;
createNode animCurveTU -n "L_wrist_CTL_FingerA_Curl";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 24 10;
createNode animCurveTU -n "L_wrist_CTL_FingerB_Curl";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 24 10;
createNode animCurveTU -n "L_wrist_CTL_ThumbCurl";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 24 10;
createNode animCurveTU -n "L_IKFK_Blend_IK_FK_Blend";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 1;
createNode animCurveTU -n "R_IKFK_Blend_IK_FK_Blend";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 1;
createNode animCurveTL -n "Global_CTL_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "Global_CTL_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "Global_CTL_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTA -n "Global_CTL_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTA -n "Global_CTL_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 90;
createNode animCurveTA -n "Global_CTL_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTU -n "Global_CTL_scaleX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 1;
createNode animCurveTU -n "Global_CTL_scaleY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 1;
createNode animCurveTU -n "Global_CTL_scaleZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 1;
createNode animCurveTU -n "Global_CTL_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 1;
	setAttr ".kot[0]"  5;
createNode animCurveTA -n "neck_CTL_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTA -n "neck_CTL_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTA -n "neck_CTL_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode phong -n "FBXASC0488___Default";
	setAttr ".dc" 1;
	setAttr ".ambc" -type "float3" 0.14901961 0.11764707 0.78039223 ;
	setAttr ".sc" -type "float3" 0 0 0 ;
	setAttr ".rfl" 1;
	setAttr ".cp" 2;
createNode shadingEngine -n "IdunSG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo7";
createNode shadingEngine -n "IdunSG1";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo8";
createNode file -n "MapFBXASC032FBXASC0350";
	setAttr ".ftn" -type "string" "F:\\Sourcetree Stuff\\DownhillMadness\\Art\\Character\\Emily\\Idun\\Idundiff.tga";
createNode place2dTexture -n "place2dTexture4";
createNode phong -n "FBXASC0482FBXASC032FBXASC045FBXASC032Default2";
	setAttr ".dc" 1;
	setAttr ".ambc" -type "float3" 0.58823532 0.58823532 0.58823532 ;
	setAttr ".sc" -type "float3" 0 0 0 ;
	setAttr ".rfl" 1;
	setAttr ".cp" 2;
createNode shadingEngine -n "BodySG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo9";
createNode shadingEngine -n "BodySG1";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo10";
createNode file -n "MapFBXASC032FBXASC0354";
	setAttr ".ftn" -type "string" "C:\\Git\\Art\\Character\\Emily\\Balder\\Baldr_diff.png";
createNode place2dTexture -n "place2dTexture5";
createNode phong -n "FBXASC0482FBXASC032FBXASC045FBXASC032Default3";
	setAttr ".dc" 1;
	setAttr ".ambc" -type "float3" 0.58823532 0.58823532 0.58823532 ;
	setAttr ".sc" -type "float3" 0 0 0 ;
	setAttr ".rfl" 1;
	setAttr ".cp" 2;
createNode shadingEngine -n "BodySG2";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo11";
createNode shadingEngine -n "BodySG3";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo12";
createNode file -n "MapFBXASC032FBXASC0355";
	setAttr ".ftn" -type "string" "C:\\Git\\Art\\Character\\Emily\\Balder\\Baldr_diff.png";
createNode place2dTexture -n "place2dTexture6";
createNode phong -n "FBXASC0482FBXASC032FBXASC045FBXASC032Default4";
	addAttr -is true -ci true -k true -sn "aktiviert" -ln "aktiviert" -min 0 -max 1 
		-at "bool";
	addAttr -is true -ci true -k true -sn "Effektliste" -ln "Effektliste" -smn 0 -smx 
		0 -at "long";
	setAttr ".dc" 1;
	setAttr ".ambc" -type "float3" 0.58823532 0.58823532 0.58823532 ;
	setAttr ".sc" -type "float3" 0 0 0 ;
	setAttr ".rfl" 1;
	setAttr ".cp" 2;
createNode shadingEngine -n "BodySG4";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo13";
createNode shadingEngine -n "BodySG5";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo14";
createNode file -n "MapFBXASC032FBXASC0356";
	setAttr ".ftn" -type "string" "C:\\Users\\Cyrain\\Desktop\\Baldr_diff.png";
createNode place2dTexture -n "place2dTexture7";
createNode phong -n "FBXASC0482FBXASC032FBXASC045FBXASC032Default5";
	setAttr ".dc" 1;
	setAttr ".ambc" -type "float3" 0.58823532 0.58823532 0.58823532 ;
	setAttr ".sc" -type "float3" 0 0 0 ;
	setAttr ".rfl" 1;
	setAttr ".cp" 2;
createNode shadingEngine -n "BodySG6";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo15";
createNode shadingEngine -n "BodySG7";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo16";
createNode file -n "MapFBXASC032FBXASC0357";
	setAttr ".ftn" -type "string" "C:\\Users\\Cyrain\\Desktop\\Baldr_diff.png";
createNode place2dTexture -n "place2dTexture8";
createNode phong -n "FBXASC0482FBXASC032FBXASC045FBXASC032Default6";
	addAttr -is true -ci true -k true -sn "aktiviert" -ln "aktiviert" -min 0 -max 1 
		-at "bool";
	addAttr -is true -ci true -k true -sn "Effektliste" -ln "Effektliste" -smn 0 -smx 
		0 -at "long";
	setAttr ".dc" 1;
	setAttr ".ambc" -type "float3" 0.58823532 0.58823532 0.58823532 ;
	setAttr ".sc" -type "float3" 0 0 0 ;
	setAttr ".rfl" 1;
	setAttr ".cp" 2;
createNode shadingEngine -n "BodySG8";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo17";
createNode shadingEngine -n "BodySG9";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo18";
createNode file -n "MapFBXASC032FBXASC0358";
	setAttr ".ftn" -type "string" "C:\\Users\\Cyrain\\Desktop\\Baldr_diff.png";
createNode place2dTexture -n "place2dTexture9";
createNode phong -n "FBXASC0482FBXASC032FBXASC045FBXASC032Default7";
	setAttr ".dc" 1;
	setAttr ".ambc" -type "float3" 0.58823532 0.58823532 0.58823532 ;
	setAttr ".sc" -type "float3" 0 0 0 ;
	setAttr ".rfl" 1;
	setAttr ".cp" 2;
createNode shadingEngine -n "BodySG10";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo19";
createNode shadingEngine -n "BodySG11";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo20";
createNode file -n "MapFBXASC032FBXASC0359";
	setAttr ".ftn" -type "string" "G:/Ygg/Balder/Baldr_diff.png";
createNode place2dTexture -n "place2dTexture10";
createNode phong -n "FBXASC0482FBXASC032FBXASC045FBXASC032Default8";
	addAttr -is true -ci true -k true -sn "aktiviert" -ln "aktiviert" -min 0 -max 1 
		-at "bool";
	addAttr -is true -ci true -k true -sn "Effektliste" -ln "Effektliste" -smn 0 -smx 
		0 -at "long";
	setAttr ".dc" 1;
	setAttr ".ambc" -type "float3" 0.58823532 0.58823532 0.58823532 ;
	setAttr ".sc" -type "float3" 0 0 0 ;
	setAttr ".rfl" 1;
	setAttr ".cp" 2;
createNode shadingEngine -n "BodySG12";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo21";
createNode shadingEngine -n "BodySG13";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo22";
createNode file -n "MapFBXASC032FBXASC0360";
	setAttr ".ftn" -type "string" "G:/Ygg/Balder/Baldr_diff.png";
createNode place2dTexture -n "place2dTexture11";
createNode phong -n "FBXASC0482FBXASC032FBXASC045FBXASC032Default9";
	addAttr -is true -ci true -k true -sn "aktiviert" -ln "aktiviert" -min 0 -max 1 
		-at "bool";
	addAttr -is true -ci true -k true -sn "Effektliste" -ln "Effektliste" -smn 0 -smx 
		0 -at "long";
	setAttr ".dc" 1;
	setAttr ".ambc" -type "float3" 0.58823532 0.58823532 0.58823532 ;
	setAttr ".sc" -type "float3" 0 0 0 ;
	setAttr ".rfl" 1;
	setAttr ".cp" 2;
createNode shadingEngine -n "top001SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo23";
createNode shadingEngine -n "top001SG1";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo24";
createNode file -n "MapFBXASC032FBXASC0361";
	setAttr ".ftn" -type "string" "G:/Ygg/Balder/Baldr_diff.png";
createNode place2dTexture -n "place2dTexture12";
createNode dagPose -n "bindPose1";
	setAttr -s 45 ".wm";
	setAttr ".wm[0]" -type "matrix" 2.2204460492503131e-016 0 -1 0 0 1 0 0 1 0 2.2204460492503131e-016 0
		 0 0 0 1;
	setAttr -s 45 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 0 1.5707963267948966 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 -7.7037197775489434e-033 -2.7755575615628914e-016
		 5.5511151231257827e-017 0 1.424802394356005e-016 12.229527782038836 0.48709851369588908 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.41143040929493635 -0.57508696586464314 0.41143040929493624 0.57508696586464336 1
		 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 1 1 1 -9.566457131126157e-017 5.597765269273377e-016
		 -2.6775390739305317e-032 0 3.5590723676166096 1.1383323917533801 1.1527855097506611e-015 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.98484885971095981 0.17341488842086855 4.9124439788985747e-017 2.7898497614983507e-016 1
		 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 1 1 1 -4.8409075801122408e-016 3.374378045704582e-016
		 2.7755575615628824e-017 0 3.4200636122724255 0.52310022607711693 -9.8317916060035439e-016 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 -0.10986118705685224 0.99394694002167905 1
		 1 1 yes;
	setAttr ".xm[4]" -type "matrix" "xform" 1 1 1 -3.6070554649867816e-016 3.029168835150981e-016
		 -3.6082248300317592e-016 0 2.8515429118308582 0.13634415491535901 -7.823928895759667e-016 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 -0.086752333693029995 0.99622990950824863 1
		 1 1 yes;
	setAttr ".xm[5]" -type "matrix" "xform" 1 1 1 -9.9645048290023209e-016 -5.9194811609881355e-016
		 1.1102230246251593e-016 0 1.1159381223732296 0.46134446549723407 -3.5500667729396573e-016 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.97581995321069848 0.21857588823077043 1.3383913094630132e-017 5.9751739112180098e-017 1
		 1 1 yes;
	setAttr ".xm[6]" -type "matrix" "xform" 1 1 1 0 0 0 0 7.2470168697665081 0.57724365801492583
		 -3.5071498530124983e-016 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.49319946235070189 0.50670927595316284 -0.49319946235070167 0.50670927595316306 1
		 1 1 yes;
	setAttr ".xm[7]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.016132007799420478
		 0.78659730184944443 1.221941388389608 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.43655745941615282 -0.55625316594884566 -0.43655745941615276 0.55625316594884577 1
		 1 1 yes;
	setAttr ".xm[8]" -type "matrix" "xform" 1 1 1 0.0007787047048543644 -0.020558098406834605
		 -0.0016419614398648014 0 3.1721130425153934 0.45592580254372805 -1.4310021641657245 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 -0.038376519503587087 0.99926335004882016 1
		 1 1 yes;
	setAttr ".xm[9]" -type "matrix" "xform" 1 1 1 0.0019962415990751412 0.045188229139570955
		 0.0038386829926782061 0 4.0274932330323399 0.18455340648272056 -0.44478080535892317 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0.040938581800437586 0.99916166485717861 1
		 1 1 yes;
	setAttr ".xm[10]" -type "matrix" "xform" 1 1 1 0 0 0 0 3.3572489402465511 -0.18509618328430122
		 0.43307604732316246 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 -0.027186165262226857 0.99963038790261616 1
		 1 1 yes;
	setAttr ".xm[11]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.91521086438699761 -0.077633468193198496
		 -0.003603413130415456 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0.6277636876009477 0.77840397771957703 1
		 1 1 yes;
	setAttr ".xm[12]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.94102488066337742 0.29847053014152802
		 0.12738552651631818 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 -0.32254909470971965 0.94655273572154464 1
		 1 1 yes;
	setAttr ".xm[13]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.73642750578698468 0.00031851735383625623
		 0.023161004821148357 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0.020983727007966382 0.99977981736023014 1
		 1 1 yes;
	setAttr ".xm[14]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.90103318856088421 0.0003807521744185749
		 0.023161004821148357 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 -0.020983727007966406 0.99977981736023014 1
		 1 1 yes;
	setAttr ".xm[15]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.42397349582730443 -0.65690366521336552
		 -0.092690460224575361 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 -0.53467637711543281 0.84505690444769188 1
		 1 1 yes;
	setAttr ".xm[16]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.84911705038025076 -0.062229517682027335
		 0.012797058404320771 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 -0.0018487497591875301 0.9999982910607037 1
		 1 1 yes;
	setAttr ".xm[17]" -type "matrix" "xform" 1 1 1 0 0 0 0 1.0420591646967061 0.00073208636074184597
		 0.14076764244752094 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0.001848749759187528 0.9999982910607037 1
		 1 1 yes;
	setAttr ".xm[18]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.20184749556034115
		 -0.86610446256733153 -0.092690460224575277 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 -0.71237113058690604 0.70180294407072219 1 1 1 yes;
	setAttr ".xm[19]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.88011046274983151 -0.054229413530510584
		 0.012797058404320438 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[20]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.94274160571279708 0.0028027984697907016
		 0.14076764244752116 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0.71237113058690604 0.70180294407072219 1
		 1 1 yes;
	setAttr ".xm[21]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.016132007799416925
		 0.78659730184944543 -1.2219999999999989 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.43655745941615282 -0.55625316594884566 -0.43655745941615276 0.55625316594884577 1
		 1 1 yes;
	setAttr ".xm[22]" -type "matrix" "xform" 1 1 1 1.361332095332312e-007 5.0611104762963648e-009
		 -2.1566018843447531e-010 0 -3.1720500000000031 0.45594982413315677 -1.4310019052385563 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.99926335004882005 -0.038376519503587808 2.3498840886242393e-018 6.1187233157127427e-017 1
		 1 1 yes;
	setAttr ".xm[23]" -type "matrix" "xform" 1 1 1 -8.3143304747939565e-013 -1.8519394910537884e-011
		 -1.4707743295202117e-012 0 -4.0274995878401247 -0.18453867900157661 0.4447811000000001 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1.0527878831862125e-008 4.3135805135688143e-010 0.040938581800438252 0.9991616648571785 1
		 1 1 yes;
	setAttr ".xm[24]" -type "matrix" "xform" 1 1 1 0 0 0 0 -3.3572548292865605 0.18511889004937743
		 -0.43307610390108919 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1.6669416296665209e-008 -4.5334506808744195e-010 -0.027186165262226222 0.99963038790261605 1
		 1 1 yes;
	setAttr ".xm[25]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.9235366101612108 0.077527412757547154
		 0.0035012888287024313 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2.0090270612001729e-008 5.0192686291526338e-008 0.62776368760094503 0.77840397771957726 1
		 1 1 yes;
	setAttr ".xm[26]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.94177244551957529
		 -0.29549915213612188 -0.12742423615426257 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		5.1342009991794409e-008 -5.1987606015543586e-008 -0.32254909470971543 0.94655273572154319 1
		 1 1 yes;
	setAttr ".xm[27]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.73686142557375689
		 9.7470251287035126e-005 -0.023168048703514632 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		1.0829693653107223e-007 2.272973821343139e-009 0.020983727007965764 0.99977981736022425 1
		 1 1 yes;
	setAttr ".xm[28]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.90149585114628294
		 -2.7279365417243184e-005 -0.023168040522504652 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		2.1624302491187141e-007 -4.5385839195156919e-009 -0.020983727007965393 0.99977981736020671 1
		 1 1 yes;
	setAttr ".xm[29]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.42341465003819889
		 0.65460344263820203 0.092718579793075989 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 4.5836769991177505e-008 -8.617771773413604e-008 -0.53467637711542559 0.84505690444769088 1
		 1 1 yes;
	setAttr ".xm[30]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.84946433610835115
		 0.062261074007945894 -0.012800963733368448 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		1.082264858731123e-007 -2.0008403162546368e-010 -0.0018487497591724628 0.99999829106069782 1
		 1 1 yes;
	setAttr ".xm[31]" -type "matrix" "xform" 1 1 1 0 0 0 0 -1.045476317045928 1.611173466997684e-005
		 -0.14081045437276485 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2.1619562777823308e-007 3.9969229783577835e-010 0.0018487497591574164 0.99999829106068039 1
		 1 1 yes;
	setAttr ".xm[32]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.20233400626084619 0.86377521210038544
		 0.092718557425021358 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 3.8778110832397462e-008 -1.1554038685144089e-007 -0.71237113058689649 0.7018029440707213 1
		 1 1 yes;
	setAttr ".xm[33]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.88045937541103481
		 0.054152174004002518 -0.012800962096376406 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		1.0950072449966568e-007 0 0 0.999999999999994 1 1 1 yes;
	setAttr ".xm[34]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.94612845272188295
		 -0.0036607922686506811 -0.14081045193533209 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		1.5333967147050541e-007 4.6656150838704184e-007 0.71237113058675339 0.70180294407070531 1
		 1 1 yes;
	setAttr ".xm[35]" -type "matrix" "xform" 1 1 1 -0.00092364411719394665 0.00016978363935032134
		 1.338940440884177e-005 0 -0.71371618524250735 -0.17289943243137618 -2.8484895926668266 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 -0.96952793700812423 0.24498077345124603 1
		 1 1 yes;
	setAttr ".xm[36]" -type "matrix" "xform" 1 1 1 7.6059023283251483e-021 2.3274892731508637e-020
		 2.2121417238539397e-005 0 5.2251490345599745 -0.033112070886522904 -8.8817841970012523e-016 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.97693047861737403 -0.21355757993671967 -1.3076630335157938e-017 5.9819739181412944e-017 1
		 1 1 yes;
	setAttr ".xm[37]" -type "matrix" "xform" 1 1 1 0.00078382471587080439 -0.00051726569653544167
		 -0.0028527496440904918 0 4.46297055164663 -0.19219293746863964 -1.3322676295501878e-015 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.91413874591318767 -0.40540147165527718 -2.4823680731613083e-017 5.5974854457958044e-017 1
		 1 1 yes;
	setAttr ".xm[38]" -type "matrix" "xform" 1 1 1 1.6811970624318263e-017 5.1497543270975067e-014
		 0.00068424070415414051 0 3.300893556600407 1.4975401011280089 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0.47949901376798248 0.87754241823146772 1 1 1 yes;
	setAttr ".xm[39]" -type "matrix" "xform" 1 1 1 0 0 0 0 1.6846309758415936 1.4578127656211456e-005
		 8.8817841970012523e-016 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.15430899614513094 -0.98802263825718184 2.7988403444014215e-016 4.3712180995862575e-017 1
		 1 1 yes;
	setAttr ".xm[40]" -type "matrix" "xform" 1 1 1 -0.0017810577535851298 -0.0002637931246291661
		 8.0237567529533728e-006 0 -0.71371618524250735 -0.17289943243137529 2.8480000000000008 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 -0.96952793700922724 0.24498077344688082 1
		 1 1 yes;
	setAttr ".xm[41]" -type "matrix" "xform" 1 1 1 2.3213108152764186e-021 3.8140450396755799e-021
		 1.0838936273843892e-005 0 5.2251490345575737 -0.033112071266125032 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.97693047861737403 -0.21355757993672009 -1.3076630335157964e-017 5.9819739181412944e-017 1
		 1 1 yes;
	setAttr ".xm[42]" -type "matrix" "xform" 1 1 1 0.0017411848308490818 -0.00045825836503719542
		 -5.8662471388762795e-007 0 4.4629705516736404 -0.19219293723639558 -1.3322676295501878e-015 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.91413874591318767 -0.40540147165527718 -2.4823680731613083e-017 5.5974854457958044e-017 1
		 1 1 yes;
	setAttr ".xm[43]" -type "matrix" "xform" 1 1 1 -4.3679827998066207e-008 -3.779848293751464e-013
		 -9.3550510396206453e-016 0 3.311276950103947 1.4908758104599411 2.0689464363954357e-008 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0.47949901376798248 0.87754241823146772 1
		 1 1 yes;
	setAttr ".xm[44]" -type "matrix" "xform" 1 1 1 0 0 0 0 1.6846309758415954 1.4578009601075894e-005
		 3.6080608722954821e-008 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.15430899614513094 -0.98802263825718184 2.7988403444014215e-016 4.3712180995862575e-017 1
		 1 1 yes;
	setAttr -s 45 ".m";
	setAttr -s 45 ".p";
	setAttr -s 45 ".g[0:44]" yes no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no no no no no no no no no no no no 
		no no no no;
	setAttr ".bp" yes;
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :renderPartition;
	setAttr -s 29 ".st";
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultShaderList1;
	setAttr -s 18 ".s";
select -ne :defaultTextureList1;
	setAttr -s 12 ".tx";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -s 12 ".u";
select -ne :defaultRenderingList1;
select -ne :renderGlobalsList1;
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 18 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surfaces" "Particles" "Fluids" "Image Planes" "UI:" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 18 0 1 1 1 1 1
		 1 0 0 0 0 0 0 0 0 0 0 0 ;
select -ne :defaultHardwareRenderGlobals;
	setAttr ".fn" -type "string" "im";
	setAttr ".res" -type "string" "ntsc_4d 646 485 1.333";
select -ne :ikSystem;
	setAttr -s 2 ".sol";
connectAttr "Global_CTL_translateX.o" "Global_CTL.tx";
connectAttr "Global_CTL_translateY.o" "Global_CTL.ty";
connectAttr "Global_CTL_translateZ.o" "Global_CTL.tz";
connectAttr "Global_CTL_rotateX.o" "Global_CTL.rx";
connectAttr "Global_CTL_rotateY.o" "Global_CTL.ry";
connectAttr "Global_CTL_rotateZ.o" "Global_CTL.rz";
connectAttr "Global_CTL_scaleX.o" "Global_CTL.sx";
connectAttr "Global_CTL_scaleY.o" "Global_CTL.sy";
connectAttr "Global_CTL_scaleZ.o" "Global_CTL.sz";
connectAttr "Global_CTL_visibility.o" "Global_CTL.v";
connectAttr "makeNurbCircle6.oc" "Global_CTLShape.cr";
connectAttr "cons.di" "Controllers.do";
connectAttr "L_foot_CTL_footRoll.o" "L_foot_CTL.footRoll";
connectAttr "L_foot_CTL_translateX.o" "L_foot_CTL.tx";
connectAttr "L_foot_CTL_translateY.o" "L_foot_CTL.ty";
connectAttr "L_foot_CTL_translateZ.o" "L_foot_CTL.tz";
connectAttr "L_foot_CTL_rotateX.o" "L_foot_CTL.rx";
connectAttr "L_foot_CTL_rotateY.o" "L_foot_CTL.ry";
connectAttr "L_foot_CTL_rotateZ.o" "L_foot_CTL.rz";
connectAttr "L_invHeel_JNT_rotateZ.o" "L_invHeel_JNT.rz";
connectAttr "L_invHeel_JNT.s" "L_invToe_JNT.is";
connectAttr "L_invToe_JNT_rotateZ.o" "L_invToe_JNT.rz";
connectAttr "L_invToe_JNT.s" "L_invBall_JNT.is";
connectAttr "L_invBall_JNT_rotateZ.o" "L_invBall_JNT.rz";
connectAttr "L_invBall_JNT.s" "L_invAnkle_JNT.is";
connectAttr "ANM_L_thigh_JNT.msg" "L_ankle_IK.hsj";
connectAttr "|Global_CTL|ANM_pelvis_JNT|ANM_L_thigh_JNT|ANM_L_kne_JNT|ANM_L_effector1.hp" "L_ankle_IK.hee"
		;
connectAttr "ikRPsolver.msg" "L_ankle_IK.hsv";
connectAttr "L_ankle_IK_poleVectorConstraint1.ctx" "L_ankle_IK.pvx";
connectAttr "L_ankle_IK_poleVectorConstraint1.cty" "L_ankle_IK.pvy";
connectAttr "L_ankle_IK_poleVectorConstraint1.ctz" "L_ankle_IK.pvz";
connectAttr "L_ankle_IK.pim" "L_ankle_IK_poleVectorConstraint1.cpim";
connectAttr "ANM_L_thigh_JNT.pm" "L_ankle_IK_poleVectorConstraint1.ps";
connectAttr "ANM_L_thigh_JNT.t" "L_ankle_IK_poleVectorConstraint1.crp";
connectAttr "L_knee_CTL.t" "L_ankle_IK_poleVectorConstraint1.tg[0].tt";
connectAttr "L_knee_CTL.rp" "L_ankle_IK_poleVectorConstraint1.tg[0].trp";
connectAttr "L_knee_CTL.rpt" "L_ankle_IK_poleVectorConstraint1.tg[0].trt";
connectAttr "L_knee_CTL.pm" "L_ankle_IK_poleVectorConstraint1.tg[0].tpm";
connectAttr "L_ankle_IK_poleVectorConstraint1.w0" "L_ankle_IK_poleVectorConstraint1.tg[0].tw"
		;
connectAttr "ANM_L_ankle_JNT.msg" "L_ball_IK.hsj";
connectAttr "effector1.hp" "L_ball_IK.hee";
connectAttr "ikRPsolver.msg" "L_ball_IK.hsv";
connectAttr "ANM_L_ball_JNT.msg" "L_toe_IK.hsj";
connectAttr "effector2.hp" "L_toe_IK.hee";
connectAttr "ikRPsolver.msg" "L_toe_IK.hsv";
connectAttr "L_knee_CTL_translateX.o" "L_knee_CTL.tx";
connectAttr "R_foot_CTL_footRoll.o" "R_foot_CTL.footRoll";
connectAttr "R_foot_CTL_translateX.o" "R_foot_CTL.tx";
connectAttr "R_foot_CTL_translateY.o" "R_foot_CTL.ty";
connectAttr "R_foot_CTL_translateZ.o" "R_foot_CTL.tz";
connectAttr "R_foot_CTL_rotateX.o" "R_foot_CTL.rx";
connectAttr "R_foot_CTL_rotateY.o" "R_foot_CTL.ry";
connectAttr "R_foot_CTL_rotateZ.o" "R_foot_CTL.rz";
connectAttr "R_invHeel_JNT_rotateZ.o" "R_invHeel_JNT.rz";
connectAttr "R_invHeel_JNT.s" "R_invToe_JNT.is";
connectAttr "R_invToe_JNT_rotateZ.o" "R_invToe_JNT.rz";
connectAttr "R_invToe_JNT.s" "R_invBall_JNT.is";
connectAttr "R_invBall_JNT_rotateZ.o" "R_invBall_JNT.rz";
connectAttr "R_invBall_JNT.s" "R_invAnkle_JNT.is";
connectAttr "ANM_R_thigh_JNT.msg" "R_ankle_IK.hsj";
connectAttr "ANM_R_effector1.hp" "R_ankle_IK.hee";
connectAttr "ikRPsolver1.msg" "R_ankle_IK.hsv";
connectAttr "R_ankle_IK_poleVectorConstraint1.ctx" "R_ankle_IK.pvx";
connectAttr "R_ankle_IK_poleVectorConstraint1.cty" "R_ankle_IK.pvy";
connectAttr "R_ankle_IK_poleVectorConstraint1.ctz" "R_ankle_IK.pvz";
connectAttr "R_ankle_IK.pim" "R_ankle_IK_poleVectorConstraint1.cpim";
connectAttr "ANM_R_thigh_JNT.pm" "R_ankle_IK_poleVectorConstraint1.ps";
connectAttr "ANM_R_thigh_JNT.t" "R_ankle_IK_poleVectorConstraint1.crp";
connectAttr "R_knee_CTL.t" "R_ankle_IK_poleVectorConstraint1.tg[0].tt";
connectAttr "R_knee_CTL.rp" "R_ankle_IK_poleVectorConstraint1.tg[0].trp";
connectAttr "R_knee_CTL.rpt" "R_ankle_IK_poleVectorConstraint1.tg[0].trt";
connectAttr "R_knee_CTL.pm" "R_ankle_IK_poleVectorConstraint1.tg[0].tpm";
connectAttr "R_ankle_IK_poleVectorConstraint1.w0" "R_ankle_IK_poleVectorConstraint1.tg[0].tw"
		;
connectAttr "ANM_R_ankle_JNT.msg" "R_ball_IK.hsj";
connectAttr "effector3.hp" "R_ball_IK.hee";
connectAttr "ikRPsolver.msg" "R_ball_IK.hsv";
connectAttr "ANM_R_ball_JNT.msg" "R_toe_IK.hsj";
connectAttr "effector4.hp" "R_toe_IK.hee";
connectAttr "ikRPsolver.msg" "R_toe_IK.hsv";
connectAttr "R_knee_CTL_translateX.o" "R_knee_CTL.tx";
connectAttr "pelvis_CTL_translateX.o" "pelvis_CTL.tx";
connectAttr "pelvis_CTL_translateY.o" "pelvis_CTL.ty";
connectAttr "pelvis_CTL_translateZ.o" "pelvis_CTL.tz";
connectAttr "pelvis_CTL_rotateX.o" "pelvis_CTL.rx";
connectAttr "pelvis_CTL_rotateY.o" "pelvis_CTL.ry";
connectAttr "pelvis_CTL_rotateZ.o" "pelvis_CTL.rz";
connectAttr "Spine_CTL_translateX.o" "Spine_CTL.tx";
connectAttr "Spine_CTL_translateY.o" "Spine_CTL.ty";
connectAttr "Spine_CTL_translateZ.o" "Spine_CTL.tz";
connectAttr "Spine_CTL_rotateX.o" "Spine_CTL.rx";
connectAttr "Spine_CTL_rotateY.o" "Spine_CTL.ry";
connectAttr "Spine_CTL_rotateZ.o" "Spine_CTL.rz";
connectAttr "breast_CTL_rotateX.o" "breast_CTL.rx";
connectAttr "breast_CTL_rotateY.o" "breast_CTL.ry";
connectAttr "breast_CTL_rotateZ.o" "breast_CTL.rz";
connectAttr "R_shoulder_CTL_translateX.o" "R_shoulder_CTL.tx";
connectAttr "R_shoulder_CTL_translateY.o" "R_shoulder_CTL.ty";
connectAttr "R_shoulder_CTL_translateZ.o" "R_shoulder_CTL.tz";
connectAttr "R_shoulder_CTL_rotateX.o" "R_shoulder_CTL.rx";
connectAttr "R_shoulder_CTL_rotateY.o" "R_shoulder_CTL.ry";
connectAttr "R_shoulder_CTL_rotateZ.o" "R_shoulder_CTL.rz";
connectAttr "R_wrist_CTL_wristCurl.o" "R_wrist_CTL.wristCurl";
connectAttr "R_wrist_CTL_Finger_A_Curl.o" "R_wrist_CTL.Finger_A_Curl";
connectAttr "R_wrist_CTL_Finger_B_Curl.o" "R_wrist_CTL.Finger_B_Curl";
connectAttr "R_wrist_CTL_ThumbCurl.o" "R_wrist_CTL.ThumbCurl";
connectAttr "R_wrist_CTL_translateX.o" "R_wrist_CTL.tx";
connectAttr "R_wrist_CTL_translateY.o" "R_wrist_CTL.ty";
connectAttr "R_wrist_CTL_translateZ.o" "R_wrist_CTL.tz";
connectAttr "R_wrist_CTL_rotateX.o" "R_wrist_CTL.rx";
connectAttr "R_wrist_CTL_rotateY.o" "R_wrist_CTL.ry";
connectAttr "R_wrist_CTL_rotateZ.o" "R_wrist_CTL.rz";
connectAttr "ANM_R_shoulder_JNT.msg" "R_wrist_IK.hsj";
connectAttr "ANM_L_effector2.hp" "R_wrist_IK.hee";
connectAttr "ikRPsolver.msg" "R_wrist_IK.hsv";
connectAttr "R_IKFK_Blend_IK_FK_Blend.o" "R_IKFK_Blend.IK_FK_Blend";
connectAttr "L_shoulder_CTL_translateX.o" "L_shoulder_CTL.tx";
connectAttr "L_shoulder_CTL_translateY.o" "L_shoulder_CTL.ty";
connectAttr "L_shoulder_CTL_translateZ.o" "L_shoulder_CTL.tz";
connectAttr "L_shoulder_CTL_rotateX.o" "L_shoulder_CTL.rx";
connectAttr "L_shoulder_CTL_rotateY.o" "L_shoulder_CTL.ry";
connectAttr "L_shoulder_CTL_rotateZ.o" "L_shoulder_CTL.rz";
connectAttr "L_wrist_CTL_wristCurl.o" "L_wrist_CTL.wristCurl";
connectAttr "L_wrist_CTL_FingerA_Curl.o" "L_wrist_CTL.FingerA_Curl";
connectAttr "L_wrist_CTL_FingerB_Curl.o" "L_wrist_CTL.FingerB_Curl";
connectAttr "L_wrist_CTL_ThumbCurl.o" "L_wrist_CTL.ThumbCurl";
connectAttr "L_wrist_CTL_translateX.o" "L_wrist_CTL.tx";
connectAttr "L_wrist_CTL_translateY.o" "L_wrist_CTL.ty";
connectAttr "L_wrist_CTL_translateZ.o" "L_wrist_CTL.tz";
connectAttr "L_wrist_CTL_rotateX.o" "L_wrist_CTL.rx";
connectAttr "L_wrist_CTL_rotateY.o" "L_wrist_CTL.ry";
connectAttr "L_wrist_CTL_rotateZ.o" "L_wrist_CTL.rz";
connectAttr "ANM_L_shoulder_JNT.msg" "L_wrist_IK.hsj";
connectAttr "|Global_CTL|ANM_pelvis_JNT|ANM_spine1_JNT|ANM_spine2_JNT|ANM_L_clavicle_JNT|ANM_L_shoulder_JNT|ANM_L_elbow_JNT|ANM_L_effector1.hp" "L_wrist_IK.hee"
		;
connectAttr "ikRPsolver.msg" "L_wrist_IK.hsv";
connectAttr "L_wrist_IK_ikBlend.o" "L_wrist_IK.ikb";
connectAttr "L_IKFK_Blend_IK_FK_Blend.o" "L_IKFK_Blend.IK_FK_Blend";
connectAttr "neck_CTL_rotateY.o" "neck_CTL.ry";
connectAttr "neck_CTL_rotateZ.o" "neck_CTL.rz";
connectAttr "neck_CTL_rotateX.o" "neck_CTL.rx";
connectAttr "head_CTL_rotateZ.o" "head_CTL.rz";
connectAttr "head_CTL_rotateX.o" "head_CTL.rx";
connectAttr "head_CTL_rotateY.o" "head_CTL.ry";
connectAttr "ANM_pelvis_JNT_parentConstraint1.ctx" "ANM_pelvis_JNT.tx";
connectAttr "ANM_pelvis_JNT_parentConstraint1.cty" "ANM_pelvis_JNT.ty";
connectAttr "ANM_pelvis_JNT_parentConstraint1.ctz" "ANM_pelvis_JNT.tz";
connectAttr "ANM_pelvis_JNT_parentConstraint1.crx" "ANM_pelvis_JNT.rx";
connectAttr "ANM_pelvis_JNT_parentConstraint1.cry" "ANM_pelvis_JNT.ry";
connectAttr "ANM_pelvis_JNT_parentConstraint1.crz" "ANM_pelvis_JNT.rz";
connectAttr "rigg.di" "ANM_pelvis_JNT.do";
connectAttr "ANM_pelvis_JNT.s" "ANM_spine1_JNT.is";
connectAttr "ANM_spine1_JNT_parentConstraint1.ctx" "ANM_spine1_JNT.tx";
connectAttr "ANM_spine1_JNT_parentConstraint1.cty" "ANM_spine1_JNT.ty";
connectAttr "ANM_spine1_JNT_parentConstraint1.ctz" "ANM_spine1_JNT.tz";
connectAttr "ANM_spine1_JNT_parentConstraint1.crx" "ANM_spine1_JNT.rx";
connectAttr "ANM_spine1_JNT_parentConstraint1.cry" "ANM_spine1_JNT.ry";
connectAttr "ANM_spine1_JNT_parentConstraint1.crz" "ANM_spine1_JNT.rz";
connectAttr "ANM_spine1_JNT.s" "ANM_spine2_JNT.is";
connectAttr "ANM_spine2_JNT_parentConstraint1.ctx" "ANM_spine2_JNT.tx";
connectAttr "ANM_spine2_JNT_parentConstraint1.cty" "ANM_spine2_JNT.ty";
connectAttr "ANM_spine2_JNT_parentConstraint1.ctz" "ANM_spine2_JNT.tz";
connectAttr "ANM_spine2_JNT_parentConstraint1.crx" "ANM_spine2_JNT.rx";
connectAttr "ANM_spine2_JNT_parentConstraint1.cry" "ANM_spine2_JNT.ry";
connectAttr "ANM_spine2_JNT_parentConstraint1.crz" "ANM_spine2_JNT.rz";
connectAttr "ANM_spine2_JNT.s" "ANM_neck_JNT.is";
connectAttr "ANM_neck_JNT_parentConstraint1.ctx" "ANM_neck_JNT.tx";
connectAttr "ANM_neck_JNT_parentConstraint1.cty" "ANM_neck_JNT.ty";
connectAttr "ANM_neck_JNT_parentConstraint1.ctz" "ANM_neck_JNT.tz";
connectAttr "ANM_neck_JNT_parentConstraint1.crx" "ANM_neck_JNT.rx";
connectAttr "ANM_neck_JNT_parentConstraint1.cry" "ANM_neck_JNT.ry";
connectAttr "ANM_neck_JNT_parentConstraint1.crz" "ANM_neck_JNT.rz";
connectAttr "ANM_neck_JNT.s" "ANM_head_JNT.is";
connectAttr "ANM_head_JNT_parentConstraint1.ctx" "ANM_head_JNT.tx";
connectAttr "ANM_head_JNT_parentConstraint1.cty" "ANM_head_JNT.ty";
connectAttr "ANM_head_JNT_parentConstraint1.ctz" "ANM_head_JNT.tz";
connectAttr "ANM_head_JNT_parentConstraint1.crx" "ANM_head_JNT.rx";
connectAttr "ANM_head_JNT_parentConstraint1.cry" "ANM_head_JNT.ry";
connectAttr "ANM_head_JNT_parentConstraint1.crz" "ANM_head_JNT.rz";
connectAttr "ANM_head_JNT.s" "ANM_brain_JNT.is";
connectAttr "ANM_head_JNT.ro" "ANM_head_JNT_parentConstraint1.cro";
connectAttr "ANM_head_JNT.pim" "ANM_head_JNT_parentConstraint1.cpim";
connectAttr "ANM_head_JNT.rp" "ANM_head_JNT_parentConstraint1.crp";
connectAttr "ANM_head_JNT.rpt" "ANM_head_JNT_parentConstraint1.crt";
connectAttr "ANM_head_JNT.jo" "ANM_head_JNT_parentConstraint1.cjo";
connectAttr "head_CTL.t" "ANM_head_JNT_parentConstraint1.tg[0].tt";
connectAttr "head_CTL.rp" "ANM_head_JNT_parentConstraint1.tg[0].trp";
connectAttr "head_CTL.rpt" "ANM_head_JNT_parentConstraint1.tg[0].trt";
connectAttr "head_CTL.r" "ANM_head_JNT_parentConstraint1.tg[0].tr";
connectAttr "head_CTL.ro" "ANM_head_JNT_parentConstraint1.tg[0].tro";
connectAttr "head_CTL.s" "ANM_head_JNT_parentConstraint1.tg[0].ts";
connectAttr "head_CTL.pm" "ANM_head_JNT_parentConstraint1.tg[0].tpm";
connectAttr "ANM_head_JNT_parentConstraint1.w0" "ANM_head_JNT_parentConstraint1.tg[0].tw"
		;
connectAttr "ANM_neck_JNT.ro" "ANM_neck_JNT_parentConstraint1.cro";
connectAttr "ANM_neck_JNT.pim" "ANM_neck_JNT_parentConstraint1.cpim";
connectAttr "ANM_neck_JNT.rp" "ANM_neck_JNT_parentConstraint1.crp";
connectAttr "ANM_neck_JNT.rpt" "ANM_neck_JNT_parentConstraint1.crt";
connectAttr "ANM_neck_JNT.jo" "ANM_neck_JNT_parentConstraint1.cjo";
connectAttr "neck_CTL.t" "ANM_neck_JNT_parentConstraint1.tg[0].tt";
connectAttr "neck_CTL.rp" "ANM_neck_JNT_parentConstraint1.tg[0].trp";
connectAttr "neck_CTL.rpt" "ANM_neck_JNT_parentConstraint1.tg[0].trt";
connectAttr "neck_CTL.r" "ANM_neck_JNT_parentConstraint1.tg[0].tr";
connectAttr "neck_CTL.ro" "ANM_neck_JNT_parentConstraint1.tg[0].tro";
connectAttr "neck_CTL.s" "ANM_neck_JNT_parentConstraint1.tg[0].ts";
connectAttr "neck_CTL.pm" "ANM_neck_JNT_parentConstraint1.tg[0].tpm";
connectAttr "ANM_neck_JNT_parentConstraint1.w0" "ANM_neck_JNT_parentConstraint1.tg[0].tw"
		;
connectAttr "ANM_spine2_JNT.s" "ANM_L_clavicle_JNT.is";
connectAttr "ANM_L_clavicle_JNT.s" "ANM_L_shoulder_JNT.is";
connectAttr "ANM_L_shoulder_JNT_parentConstraint1.ctx" "ANM_L_shoulder_JNT.tx";
connectAttr "ANM_L_shoulder_JNT_parentConstraint1.cty" "ANM_L_shoulder_JNT.ty";
connectAttr "ANM_L_shoulder_JNT_parentConstraint1.ctz" "ANM_L_shoulder_JNT.tz";
connectAttr "ANM_L_shoulder_JNT_parentConstraint1.crx" "ANM_L_shoulder_JNT.rx";
connectAttr "ANM_L_shoulder_JNT_parentConstraint1.cry" "ANM_L_shoulder_JNT.ry";
connectAttr "ANM_L_shoulder_JNT_parentConstraint1.crz" "ANM_L_shoulder_JNT.rz";
connectAttr "ANM_L_shoulder_JNT.s" "ANM_L_elbow_JNT.is";
connectAttr "ANM_L_elbow_JNT.s" "ANM_L_wrist_JNT.is";
connectAttr "ANM_L_wrist_JNT_rotateY.o" "ANM_L_wrist_JNT.ry";
connectAttr "ANM_L_wrist_JNT.s" "ANM_L_hand_JNT.is";
connectAttr "ANM_L_hand_JNT.s" "ANM_L_thumb1_JNT.is";
connectAttr "ANM_L_thumb1_JNT_rotateY.o" "ANM_L_thumb1_JNT.ry";
connectAttr "ANM_L_thumb1_JNT_rotateZ.o" "ANM_L_thumb1_JNT.rz";
connectAttr "ANM_L_thumb1_JNT.s" "ANM_L_thumb2_JNT.is";
connectAttr "ANM_L_thumb2_JNT_rotateZ.o" "ANM_L_thumb2_JNT.rz";
connectAttr "ANM_L_thumb2_JNT.s" "ANM_L_thumb3_JNT.is";
connectAttr "ANM_L_hand_JNT.s" "ANM_L_fingerA1_JNT.is";
connectAttr "ANM_L_fingerA1_JNT_rotateY.o" "ANM_L_fingerA1_JNT.ry";
connectAttr "ANM_L_fingerA1_JNT.s" "ANM_L_fingerA2_JNT.is";
connectAttr "ANM_L_fingerA2_JNT_rotateY.o" "ANM_L_fingerA2_JNT.ry";
connectAttr "ANM_L_fingerA2_JNT.s" "ANM_L_fingerA3_JNT.is";
connectAttr "ANM_L_hand_JNT.s" "ANM_L_fingerB1_JNT.is";
connectAttr "ANM_L_fingerB1_JNT_rotateY.o" "ANM_L_fingerB1_JNT.ry";
connectAttr "ANM_L_fingerB1_JNT.s" "ANM_L_fingerB2_JNT.is";
connectAttr "ANM_L_fingerB2_JNT_rotateY.o" "ANM_L_fingerB2_JNT.ry";
connectAttr "ANM_L_fingerB2_JNT.s" "ANM_L_fingerB3_JNT.is";
connectAttr "ANM_L_wrist_JNT.tx" "|Global_CTL|ANM_pelvis_JNT|ANM_spine1_JNT|ANM_spine2_JNT|ANM_L_clavicle_JNT|ANM_L_shoulder_JNT|ANM_L_elbow_JNT|ANM_L_effector1.tx"
		;
connectAttr "ANM_L_wrist_JNT.ty" "|Global_CTL|ANM_pelvis_JNT|ANM_spine1_JNT|ANM_spine2_JNT|ANM_L_clavicle_JNT|ANM_L_shoulder_JNT|ANM_L_elbow_JNT|ANM_L_effector1.ty"
		;
connectAttr "ANM_L_wrist_JNT.tz" "|Global_CTL|ANM_pelvis_JNT|ANM_spine1_JNT|ANM_spine2_JNT|ANM_L_clavicle_JNT|ANM_L_shoulder_JNT|ANM_L_elbow_JNT|ANM_L_effector1.tz"
		;
connectAttr "ANM_L_shoulder_JNT.ro" "ANM_L_shoulder_JNT_parentConstraint1.cro";
connectAttr "ANM_L_shoulder_JNT.pim" "ANM_L_shoulder_JNT_parentConstraint1.cpim"
		;
connectAttr "ANM_L_shoulder_JNT.rp" "ANM_L_shoulder_JNT_parentConstraint1.crp";
connectAttr "ANM_L_shoulder_JNT.rpt" "ANM_L_shoulder_JNT_parentConstraint1.crt";
connectAttr "ANM_L_shoulder_JNT.jo" "ANM_L_shoulder_JNT_parentConstraint1.cjo";
connectAttr "L_shoulder_CTL.t" "ANM_L_shoulder_JNT_parentConstraint1.tg[0].tt";
connectAttr "L_shoulder_CTL.rp" "ANM_L_shoulder_JNT_parentConstraint1.tg[0].trp"
		;
connectAttr "L_shoulder_CTL.rpt" "ANM_L_shoulder_JNT_parentConstraint1.tg[0].trt"
		;
connectAttr "L_shoulder_CTL.r" "ANM_L_shoulder_JNT_parentConstraint1.tg[0].tr";
connectAttr "L_shoulder_CTL.ro" "ANM_L_shoulder_JNT_parentConstraint1.tg[0].tro"
		;
connectAttr "L_shoulder_CTL.s" "ANM_L_shoulder_JNT_parentConstraint1.tg[0].ts";
connectAttr "L_shoulder_CTL.pm" "ANM_L_shoulder_JNT_parentConstraint1.tg[0].tpm"
		;
connectAttr "ANM_L_shoulder_JNT_parentConstraint1.w0" "ANM_L_shoulder_JNT_parentConstraint1.tg[0].tw"
		;
connectAttr "ANM_spine2_JNT.s" "ANM_R_clavicle_JNT.is";
connectAttr "ANM_R_clavicle_JNT.s" "ANM_R_shoulder_JNT.is";
connectAttr "ANM_R_shoulder_JNT_parentConstraint1.ctx" "ANM_R_shoulder_JNT.tx";
connectAttr "ANM_R_shoulder_JNT_parentConstraint1.cty" "ANM_R_shoulder_JNT.ty";
connectAttr "ANM_R_shoulder_JNT_parentConstraint1.ctz" "ANM_R_shoulder_JNT.tz";
connectAttr "ANM_R_shoulder_JNT_parentConstraint1.crx" "ANM_R_shoulder_JNT.rx";
connectAttr "ANM_R_shoulder_JNT_parentConstraint1.cry" "ANM_R_shoulder_JNT.ry";
connectAttr "ANM_R_shoulder_JNT_parentConstraint1.crz" "ANM_R_shoulder_JNT.rz";
connectAttr "ANM_R_shoulder_JNT.s" "ANM_R_elbow_JNT.is";
connectAttr "ANM_R_elbow_JNT.s" "ANM_R_wrist_JNT.is";
connectAttr "ANM_R_wrist_JNT_rotateY.o" "ANM_R_wrist_JNT.ry";
connectAttr "ANM_R_wrist_JNT.s" "ANM_R_hand_JNT.is";
connectAttr "ANM_R_hand_JNT.s" "ANM_R_thumb1_JNT.is";
connectAttr "ANM_R_thumb1_JNT_rotateY.o" "ANM_R_thumb1_JNT.ry";
connectAttr "ANM_R_thumb1_JNT.s" "ANM_R_thumb2_JNT.is";
connectAttr "ANM_R_thumb2_JNT_rotateZ.o" "ANM_R_thumb2_JNT.rz";
connectAttr "ANM_R_thumb2_JNT.s" "ANM_R_thumb3_JNT.is";
connectAttr "ANM_R_hand_JNT.s" "ANM_R_fingerA1_JNT.is";
connectAttr "ANM_R_fingerA1_JNT_rotateY.o" "ANM_R_fingerA1_JNT.ry";
connectAttr "ANM_R_fingerA1_JNT.s" "ANM_R_fingerA2_JNT.is";
connectAttr "ANM_R_fingerA2_JNT_rotateY.o" "ANM_R_fingerA2_JNT.ry";
connectAttr "ANM_R_fingerA2_JNT.s" "ANM_R_fingerA3_JNT.is";
connectAttr "ANM_R_hand_JNT.s" "ANM_R_fingerB1_JNT.is";
connectAttr "ANM_R_fingerB1_JNT_rotateY.o" "ANM_R_fingerB1_JNT.ry";
connectAttr "ANM_R_fingerB1_JNT.s" "ANM_R_fingerB2_JNT.is";
connectAttr "ANM_R_fingerB2_JNT_rotateY.o" "ANM_R_fingerB2_JNT.ry";
connectAttr "ANM_R_fingerB2_JNT.s" "ANM_R_fingerB3_JNT.is";
connectAttr "ANM_R_shoulder_JNT.ro" "ANM_R_shoulder_JNT_parentConstraint1.cro";
connectAttr "ANM_R_shoulder_JNT.pim" "ANM_R_shoulder_JNT_parentConstraint1.cpim"
		;
connectAttr "ANM_R_shoulder_JNT.rp" "ANM_R_shoulder_JNT_parentConstraint1.crp";
connectAttr "ANM_R_shoulder_JNT.rpt" "ANM_R_shoulder_JNT_parentConstraint1.crt";
connectAttr "ANM_R_shoulder_JNT.jo" "ANM_R_shoulder_JNT_parentConstraint1.cjo";
connectAttr "R_shoulder_CTL.t" "ANM_R_shoulder_JNT_parentConstraint1.tg[0].tt";
connectAttr "R_shoulder_CTL.rp" "ANM_R_shoulder_JNT_parentConstraint1.tg[0].trp"
		;
connectAttr "R_shoulder_CTL.rpt" "ANM_R_shoulder_JNT_parentConstraint1.tg[0].trt"
		;
connectAttr "R_shoulder_CTL.r" "ANM_R_shoulder_JNT_parentConstraint1.tg[0].tr";
connectAttr "R_shoulder_CTL.ro" "ANM_R_shoulder_JNT_parentConstraint1.tg[0].tro"
		;
connectAttr "R_shoulder_CTL.s" "ANM_R_shoulder_JNT_parentConstraint1.tg[0].ts";
connectAttr "R_shoulder_CTL.pm" "ANM_R_shoulder_JNT_parentConstraint1.tg[0].tpm"
		;
connectAttr "ANM_R_shoulder_JNT_parentConstraint1.w0" "ANM_R_shoulder_JNT_parentConstraint1.tg[0].tw"
		;
connectAttr "ANM_spine2_JNT.ro" "ANM_spine2_JNT_parentConstraint1.cro";
connectAttr "ANM_spine2_JNT.pim" "ANM_spine2_JNT_parentConstraint1.cpim";
connectAttr "ANM_spine2_JNT.rp" "ANM_spine2_JNT_parentConstraint1.crp";
connectAttr "ANM_spine2_JNT.rpt" "ANM_spine2_JNT_parentConstraint1.crt";
connectAttr "ANM_spine2_JNT.jo" "ANM_spine2_JNT_parentConstraint1.cjo";
connectAttr "breast_CTL.t" "ANM_spine2_JNT_parentConstraint1.tg[0].tt";
connectAttr "breast_CTL.rp" "ANM_spine2_JNT_parentConstraint1.tg[0].trp";
connectAttr "breast_CTL.rpt" "ANM_spine2_JNT_parentConstraint1.tg[0].trt";
connectAttr "breast_CTL.r" "ANM_spine2_JNT_parentConstraint1.tg[0].tr";
connectAttr "breast_CTL.ro" "ANM_spine2_JNT_parentConstraint1.tg[0].tro";
connectAttr "breast_CTL.s" "ANM_spine2_JNT_parentConstraint1.tg[0].ts";
connectAttr "breast_CTL.pm" "ANM_spine2_JNT_parentConstraint1.tg[0].tpm";
connectAttr "ANM_spine2_JNT_parentConstraint1.w0" "ANM_spine2_JNT_parentConstraint1.tg[0].tw"
		;
connectAttr "ANM_spine1_JNT.ro" "ANM_spine1_JNT_parentConstraint1.cro";
connectAttr "ANM_spine1_JNT.pim" "ANM_spine1_JNT_parentConstraint1.cpim";
connectAttr "ANM_spine1_JNT.rp" "ANM_spine1_JNT_parentConstraint1.crp";
connectAttr "ANM_spine1_JNT.rpt" "ANM_spine1_JNT_parentConstraint1.crt";
connectAttr "ANM_spine1_JNT.jo" "ANM_spine1_JNT_parentConstraint1.cjo";
connectAttr "Spine_CTL.t" "ANM_spine1_JNT_parentConstraint1.tg[0].tt";
connectAttr "Spine_CTL.rp" "ANM_spine1_JNT_parentConstraint1.tg[0].trp";
connectAttr "Spine_CTL.rpt" "ANM_spine1_JNT_parentConstraint1.tg[0].trt";
connectAttr "Spine_CTL.r" "ANM_spine1_JNT_parentConstraint1.tg[0].tr";
connectAttr "Spine_CTL.ro" "ANM_spine1_JNT_parentConstraint1.tg[0].tro";
connectAttr "Spine_CTL.s" "ANM_spine1_JNT_parentConstraint1.tg[0].ts";
connectAttr "Spine_CTL.pm" "ANM_spine1_JNT_parentConstraint1.tg[0].tpm";
connectAttr "ANM_spine1_JNT_parentConstraint1.w0" "ANM_spine1_JNT_parentConstraint1.tg[0].tw"
		;
connectAttr "ANM_pelvis_JNT.s" "ANM_L_thigh_JNT.is";
connectAttr "ANM_L_thigh_JNT.s" "ANM_L_kne_JNT.is";
connectAttr "ANM_L_kne_JNT.s" "ANM_L_ankle_JNT.is";
connectAttr "ANM_L_ankle_JNT.s" "ANM_L_ball_JNT.is";
connectAttr "ANM_L_ball_JNT.s" "ANM_L_toe_JNT.is";
connectAttr "ANM_L_toe_JNT.tx" "effector2.tx";
connectAttr "ANM_L_toe_JNT.ty" "effector2.ty";
connectAttr "ANM_L_toe_JNT.tz" "effector2.tz";
connectAttr "ANM_L_ball_JNT.tx" "effector1.tx";
connectAttr "ANM_L_ball_JNT.ty" "effector1.ty";
connectAttr "ANM_L_ball_JNT.tz" "effector1.tz";
connectAttr "ANM_L_ankle_JNT.tx" "|Global_CTL|ANM_pelvis_JNT|ANM_L_thigh_JNT|ANM_L_kne_JNT|ANM_L_effector1.tx"
		;
connectAttr "ANM_L_ankle_JNT.ty" "|Global_CTL|ANM_pelvis_JNT|ANM_L_thigh_JNT|ANM_L_kne_JNT|ANM_L_effector1.ty"
		;
connectAttr "ANM_L_ankle_JNT.tz" "|Global_CTL|ANM_pelvis_JNT|ANM_L_thigh_JNT|ANM_L_kne_JNT|ANM_L_effector1.tz"
		;
connectAttr "ANM_pelvis_JNT.s" "ANM_R_thigh_JNT.is";
connectAttr "ANM_R_thigh_JNT.s" "ANM_R_kne_JNT.is";
connectAttr "ANM_R_kne_JNT.s" "ANM_R_ankle_JNT.is";
connectAttr "ANM_R_ankle_JNT.s" "ANM_R_ball_JNT.is";
connectAttr "ANM_R_ball_JNT.s" "ANM_R_toe_JNT.is";
connectAttr "ANM_R_toe_JNT.tx" "effector4.tx";
connectAttr "ANM_R_toe_JNT.ty" "effector4.ty";
connectAttr "ANM_R_toe_JNT.tz" "effector4.tz";
connectAttr "ANM_R_ball_JNT.tx" "effector3.tx";
connectAttr "ANM_R_ball_JNT.ty" "effector3.ty";
connectAttr "ANM_R_ball_JNT.tz" "effector3.tz";
connectAttr "ANM_R_ankle_JNT.tx" "ANM_R_effector1.tx";
connectAttr "ANM_R_ankle_JNT.ty" "ANM_R_effector1.ty";
connectAttr "ANM_R_ankle_JNT.tz" "ANM_R_effector1.tz";
connectAttr "ANM_pelvis_JNT.ro" "ANM_pelvis_JNT_parentConstraint1.cro";
connectAttr "ANM_pelvis_JNT.pim" "ANM_pelvis_JNT_parentConstraint1.cpim";
connectAttr "ANM_pelvis_JNT.rp" "ANM_pelvis_JNT_parentConstraint1.crp";
connectAttr "ANM_pelvis_JNT.rpt" "ANM_pelvis_JNT_parentConstraint1.crt";
connectAttr "ANM_pelvis_JNT.jo" "ANM_pelvis_JNT_parentConstraint1.cjo";
connectAttr "pelvis_CTL.t" "ANM_pelvis_JNT_parentConstraint1.tg[0].tt";
connectAttr "pelvis_CTL.rp" "ANM_pelvis_JNT_parentConstraint1.tg[0].trp";
connectAttr "pelvis_CTL.rpt" "ANM_pelvis_JNT_parentConstraint1.tg[0].trt";
connectAttr "pelvis_CTL.r" "ANM_pelvis_JNT_parentConstraint1.tg[0].tr";
connectAttr "pelvis_CTL.ro" "ANM_pelvis_JNT_parentConstraint1.tg[0].tro";
connectAttr "pelvis_CTL.s" "ANM_pelvis_JNT_parentConstraint1.tg[0].ts";
connectAttr "pelvis_CTL.pm" "ANM_pelvis_JNT_parentConstraint1.tg[0].tpm";
connectAttr "ANM_pelvis_JNT_parentConstraint1.w0" "ANM_pelvis_JNT_parentConstraint1.tg[0].tw"
		;
connectAttr ":mentalrayGlobals.msg" ":mentalrayItemsList.glb";
connectAttr ":miDefaultOptions.msg" ":mentalrayItemsList.opt" -na;
connectAttr ":miDefaultFramebuffer.msg" ":mentalrayItemsList.fb" -na;
connectAttr ":miDefaultOptions.msg" ":mentalrayGlobals.opt";
connectAttr ":miDefaultFramebuffer.msg" ":mentalrayGlobals.fb";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "baldr1:wire_224198087.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "baldr1:default1.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert3SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "balder:default1.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "Objekt003SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "Objekt003SG1.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "Objekt003SG2.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "Objekt003SG3.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "IdunSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "IdunSG1.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "BodySG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "BodySG1.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "BodySG2.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "BodySG3.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "BodySG4.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "BodySG5.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "BodySG6.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "BodySG7.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "BodySG8.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "BodySG9.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "BodySG10.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "BodySG11.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "BodySG12.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "BodySG13.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "top001SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "top001SG1.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "baldr1:wire_224198087.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "baldr1:default1.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert3SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "balder:default1.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "Objekt003SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "Objekt003SG1.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "Objekt003SG2.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "Objekt003SG3.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "IdunSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "IdunSG1.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "BodySG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "BodySG1.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "BodySG2.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "BodySG3.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "BodySG4.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "BodySG5.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "BodySG6.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "BodySG7.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "BodySG8.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "BodySG9.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "BodySG10.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "BodySG11.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "BodySG12.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "BodySG13.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "top001SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "top001SG1.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "R_foot_CTL.footRoll" "R_invToe_JNT_rotateZ.i";
connectAttr "R_foot_CTL.footRoll" "R_invBall_JNT_rotateZ.i";
connectAttr "R_foot_CTL.footRoll" "R_invHeel_JNT_rotateZ.i";
connectAttr "L_foot_CTL.footRoll" "L_invHeel_JNT_rotateZ.i";
connectAttr "L_foot_CTL.footRoll" "L_invToe_JNT_rotateZ.i";
connectAttr "L_foot_CTL.footRoll" "L_invBall_JNT_rotateZ.i";
connectAttr "L_wrist_CTL.wristCurl" "ANM_L_wrist_JNT_rotateY.i";
connectAttr "L_wrist_CTL.ThumbCurl" "ANM_L_thumb1_JNT_rotateY.i";
connectAttr "L_wrist_CTL.ThumbCurl" "ANM_L_thumb1_JNT_rotateZ.i";
connectAttr "L_wrist_CTL.ThumbCurl" "ANM_L_thumb2_JNT_rotateZ.i";
connectAttr "L_wrist_CTL.FingerA_Curl" "ANM_L_fingerA1_JNT_rotateY.i";
connectAttr "L_wrist_CTL.FingerA_Curl" "ANM_L_fingerA2_JNT_rotateY.i";
connectAttr "L_wrist_CTL.FingerB_Curl" "ANM_L_fingerB1_JNT_rotateY.i";
connectAttr "L_wrist_CTL.FingerB_Curl" "ANM_L_fingerB2_JNT_rotateY.i";
connectAttr "L_IKFK_Blend.IK_FK_Blend" "L_wrist_IK_ikBlend.i";
connectAttr "R_wrist_CTL.wristCurl" "ANM_R_wrist_JNT_rotateY.i";
connectAttr "R_wrist_CTL.ThumbCurl" "ANM_R_thumb1_JNT_rotateY.i";
connectAttr "R_wrist_CTL.ThumbCurl" "ANM_R_thumb2_JNT_rotateZ.i";
connectAttr "R_wrist_CTL.Finger_A_Curl" "ANM_R_fingerA1_JNT_rotateY.i";
connectAttr "R_wrist_CTL.Finger_A_Curl" "ANM_R_fingerA2_JNT_rotateY.i";
connectAttr "R_wrist_CTL.Finger_B_Curl" "ANM_R_fingerB1_JNT_rotateY.i";
connectAttr "R_wrist_CTL.Finger_B_Curl" "ANM_R_fingerB2_JNT_rotateY.i";
connectAttr "baldr1:wire_224198088.oc" "baldr1:wire_224198087.ss";
connectAttr "baldr1:wire_224198087.msg" "baldr1:materialInfo1.sg";
connectAttr "baldr1:wire_224198088.msg" "baldr1:materialInfo1.m";
connectAttr "baldr1:default2.oc" "baldr1:default1.ss";
connectAttr "baldr1:default1.msg" "baldr1:materialInfo2.sg";
connectAttr "baldr1:default2.msg" "baldr1:materialInfo2.m";
connectAttr "file1.oc" "lambert2.c";
connectAttr "file1.ot" "lambert2.it";
connectAttr "lambert2.oc" "lambert2SG.ss";
connectAttr "lambert2SG.msg" "materialInfo1.sg";
connectAttr "lambert2.msg" "materialInfo1.m";
connectAttr "file1.msg" "materialInfo1.t" -na;
connectAttr "place2dTexture1.c" "file1.c";
connectAttr "place2dTexture1.tf" "file1.tf";
connectAttr "place2dTexture1.rf" "file1.rf";
connectAttr "place2dTexture1.mu" "file1.mu";
connectAttr "place2dTexture1.mv" "file1.mv";
connectAttr "place2dTexture1.s" "file1.s";
connectAttr "place2dTexture1.wu" "file1.wu";
connectAttr "place2dTexture1.wv" "file1.wv";
connectAttr "place2dTexture1.re" "file1.re";
connectAttr "place2dTexture1.of" "file1.of";
connectAttr "place2dTexture1.r" "file1.ro";
connectAttr "place2dTexture1.n" "file1.n";
connectAttr "place2dTexture1.vt1" "file1.vt1";
connectAttr "place2dTexture1.vt2" "file1.vt2";
connectAttr "place2dTexture1.vt3" "file1.vt3";
connectAttr "place2dTexture1.vc1" "file1.vc1";
connectAttr "place2dTexture1.o" "file1.uv";
connectAttr "place2dTexture1.ofs" "file1.fs";
connectAttr "file2.oc" "lambert3.c";
connectAttr "file2.ot" "lambert3.it";
connectAttr "lambert3.oc" "lambert3SG.ss";
connectAttr "lambert3SG.msg" "materialInfo2.sg";
connectAttr "lambert3.msg" "materialInfo2.m";
connectAttr "file2.msg" "materialInfo2.t" -na;
connectAttr "place2dTexture2.c" "file2.c";
connectAttr "place2dTexture2.tf" "file2.tf";
connectAttr "place2dTexture2.rf" "file2.rf";
connectAttr "place2dTexture2.mu" "file2.mu";
connectAttr "place2dTexture2.mv" "file2.mv";
connectAttr "place2dTexture2.s" "file2.s";
connectAttr "place2dTexture2.wu" "file2.wu";
connectAttr "place2dTexture2.wv" "file2.wv";
connectAttr "place2dTexture2.re" "file2.re";
connectAttr "place2dTexture2.of" "file2.of";
connectAttr "place2dTexture2.r" "file2.ro";
connectAttr "place2dTexture2.n" "file2.n";
connectAttr "place2dTexture2.vt1" "file2.vt1";
connectAttr "place2dTexture2.vt2" "file2.vt2";
connectAttr "place2dTexture2.vt3" "file2.vt3";
connectAttr "place2dTexture2.vc1" "file2.vc1";
connectAttr "place2dTexture2.o" "file2.uv";
connectAttr "place2dTexture2.ofs" "file2.fs";
connectAttr "layerManager.dli[3]" "rigg.id";
connectAttr "balder:default2.oc" "balder:default1.ss";
connectAttr "balder:default1.msg" "balder:materialInfo1.sg";
connectAttr "balder:default2.msg" "balder:materialInfo1.m";
connectAttr "layerManager.dli[4]" "cons.id";
connectAttr "MapFBXASC032FBXASC0353.oc" "FBXASC0482FBXASC032FBXASC045FBXASC032Default.c"
		;
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default.oc" "Objekt003SG.ss";
connectAttr "Objekt003SG.msg" "materialInfo3.sg";
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default.msg" "materialInfo3.m"
		;
connectAttr "MapFBXASC032FBXASC0353.msg" "materialInfo3.t" -na;
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default.oc" "Objekt003SG1.ss";
connectAttr "Objekt003SG1.msg" "materialInfo4.sg";
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default.msg" "materialInfo4.m"
		;
connectAttr "MapFBXASC032FBXASC0353.msg" "materialInfo4.t" -na;
connectAttr "place2dTexture3.o" "MapFBXASC032FBXASC0353.uv";
connectAttr "place2dTexture3.ofu" "MapFBXASC032FBXASC0353.ofu";
connectAttr "place2dTexture3.ofv" "MapFBXASC032FBXASC0353.ofv";
connectAttr "place2dTexture3.rf" "MapFBXASC032FBXASC0353.rf";
connectAttr "place2dTexture3.reu" "MapFBXASC032FBXASC0353.reu";
connectAttr "place2dTexture3.rev" "MapFBXASC032FBXASC0353.rev";
connectAttr "place2dTexture3.vt1" "MapFBXASC032FBXASC0353.vt1";
connectAttr "place2dTexture3.vt2" "MapFBXASC032FBXASC0353.vt2";
connectAttr "place2dTexture3.vt3" "MapFBXASC032FBXASC0353.vt3";
connectAttr "place2dTexture3.vc1" "MapFBXASC032FBXASC0353.vc1";
connectAttr "place2dTexture3.ofs" "MapFBXASC032FBXASC0353.fs";
connectAttr "MapFBXASC032FBXASC0353.oc" "FBXASC0482FBXASC032FBXASC045FBXASC032Default1.c"
		;
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default1.oc" "Objekt003SG2.ss"
		;
connectAttr "Objekt003SG2.msg" "materialInfo5.sg";
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default1.msg" "materialInfo5.m"
		;
connectAttr "MapFBXASC032FBXASC0353.msg" "materialInfo5.t" -na;
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default1.oc" "Objekt003SG3.ss"
		;
connectAttr "Objekt003SG3.msg" "materialInfo6.sg";
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default1.msg" "materialInfo6.m"
		;
connectAttr "MapFBXASC032FBXASC0353.msg" "materialInfo6.t" -na;
connectAttr "MapFBXASC032FBXASC0350.oc" "FBXASC0488___Default.c";
connectAttr "FBXASC0488___Default.oc" "IdunSG.ss";
connectAttr "IdunSG.msg" "materialInfo7.sg";
connectAttr "FBXASC0488___Default.msg" "materialInfo7.m";
connectAttr "MapFBXASC032FBXASC0350.msg" "materialInfo7.t" -na;
connectAttr "FBXASC0488___Default.oc" "IdunSG1.ss";
connectAttr "IdunSG1.msg" "materialInfo8.sg";
connectAttr "FBXASC0488___Default.msg" "materialInfo8.m";
connectAttr "MapFBXASC032FBXASC0350.msg" "materialInfo8.t" -na;
connectAttr "place2dTexture4.o" "MapFBXASC032FBXASC0350.uv";
connectAttr "place2dTexture4.ofu" "MapFBXASC032FBXASC0350.ofu";
connectAttr "place2dTexture4.ofv" "MapFBXASC032FBXASC0350.ofv";
connectAttr "place2dTexture4.rf" "MapFBXASC032FBXASC0350.rf";
connectAttr "place2dTexture4.reu" "MapFBXASC032FBXASC0350.reu";
connectAttr "place2dTexture4.rev" "MapFBXASC032FBXASC0350.rev";
connectAttr "place2dTexture4.vt1" "MapFBXASC032FBXASC0350.vt1";
connectAttr "place2dTexture4.vt2" "MapFBXASC032FBXASC0350.vt2";
connectAttr "place2dTexture4.vt3" "MapFBXASC032FBXASC0350.vt3";
connectAttr "place2dTexture4.vc1" "MapFBXASC032FBXASC0350.vc1";
connectAttr "place2dTexture4.ofs" "MapFBXASC032FBXASC0350.fs";
connectAttr "MapFBXASC032FBXASC0354.oc" "FBXASC0482FBXASC032FBXASC045FBXASC032Default2.c"
		;
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default2.oc" "BodySG.ss";
connectAttr "BodySG.msg" "materialInfo9.sg";
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default2.msg" "materialInfo9.m"
		;
connectAttr "MapFBXASC032FBXASC0354.msg" "materialInfo9.t" -na;
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default2.oc" "BodySG1.ss";
connectAttr "BodySG1.msg" "materialInfo10.sg";
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default2.msg" "materialInfo10.m"
		;
connectAttr "MapFBXASC032FBXASC0354.msg" "materialInfo10.t" -na;
connectAttr "place2dTexture5.o" "MapFBXASC032FBXASC0354.uv";
connectAttr "place2dTexture5.ofu" "MapFBXASC032FBXASC0354.ofu";
connectAttr "place2dTexture5.ofv" "MapFBXASC032FBXASC0354.ofv";
connectAttr "place2dTexture5.rf" "MapFBXASC032FBXASC0354.rf";
connectAttr "place2dTexture5.reu" "MapFBXASC032FBXASC0354.reu";
connectAttr "place2dTexture5.rev" "MapFBXASC032FBXASC0354.rev";
connectAttr "place2dTexture5.vt1" "MapFBXASC032FBXASC0354.vt1";
connectAttr "place2dTexture5.vt2" "MapFBXASC032FBXASC0354.vt2";
connectAttr "place2dTexture5.vt3" "MapFBXASC032FBXASC0354.vt3";
connectAttr "place2dTexture5.vc1" "MapFBXASC032FBXASC0354.vc1";
connectAttr "place2dTexture5.ofs" "MapFBXASC032FBXASC0354.fs";
connectAttr "MapFBXASC032FBXASC0355.oc" "FBXASC0482FBXASC032FBXASC045FBXASC032Default3.c"
		;
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default3.oc" "BodySG2.ss";
connectAttr "BodySG2.msg" "materialInfo11.sg";
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default3.msg" "materialInfo11.m"
		;
connectAttr "MapFBXASC032FBXASC0355.msg" "materialInfo11.t" -na;
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default3.oc" "BodySG3.ss";
connectAttr "BodySG3.msg" "materialInfo12.sg";
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default3.msg" "materialInfo12.m"
		;
connectAttr "MapFBXASC032FBXASC0355.msg" "materialInfo12.t" -na;
connectAttr "place2dTexture6.o" "MapFBXASC032FBXASC0355.uv";
connectAttr "place2dTexture6.ofu" "MapFBXASC032FBXASC0355.ofu";
connectAttr "place2dTexture6.ofv" "MapFBXASC032FBXASC0355.ofv";
connectAttr "place2dTexture6.rf" "MapFBXASC032FBXASC0355.rf";
connectAttr "place2dTexture6.reu" "MapFBXASC032FBXASC0355.reu";
connectAttr "place2dTexture6.rev" "MapFBXASC032FBXASC0355.rev";
connectAttr "place2dTexture6.vt1" "MapFBXASC032FBXASC0355.vt1";
connectAttr "place2dTexture6.vt2" "MapFBXASC032FBXASC0355.vt2";
connectAttr "place2dTexture6.vt3" "MapFBXASC032FBXASC0355.vt3";
connectAttr "place2dTexture6.vc1" "MapFBXASC032FBXASC0355.vc1";
connectAttr "place2dTexture6.ofs" "MapFBXASC032FBXASC0355.fs";
connectAttr "MapFBXASC032FBXASC0356.oc" "FBXASC0482FBXASC032FBXASC045FBXASC032Default4.c"
		;
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default4.oc" "BodySG4.ss";
connectAttr "BodySG4.msg" "materialInfo13.sg";
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default4.msg" "materialInfo13.m"
		;
connectAttr "MapFBXASC032FBXASC0356.msg" "materialInfo13.t" -na;
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default4.oc" "BodySG5.ss";
connectAttr "BodySG5.msg" "materialInfo14.sg";
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default4.msg" "materialInfo14.m"
		;
connectAttr "MapFBXASC032FBXASC0356.msg" "materialInfo14.t" -na;
connectAttr "place2dTexture7.o" "MapFBXASC032FBXASC0356.uv";
connectAttr "place2dTexture7.ofu" "MapFBXASC032FBXASC0356.ofu";
connectAttr "place2dTexture7.ofv" "MapFBXASC032FBXASC0356.ofv";
connectAttr "place2dTexture7.rf" "MapFBXASC032FBXASC0356.rf";
connectAttr "place2dTexture7.reu" "MapFBXASC032FBXASC0356.reu";
connectAttr "place2dTexture7.rev" "MapFBXASC032FBXASC0356.rev";
connectAttr "place2dTexture7.vt1" "MapFBXASC032FBXASC0356.vt1";
connectAttr "place2dTexture7.vt2" "MapFBXASC032FBXASC0356.vt2";
connectAttr "place2dTexture7.vt3" "MapFBXASC032FBXASC0356.vt3";
connectAttr "place2dTexture7.vc1" "MapFBXASC032FBXASC0356.vc1";
connectAttr "place2dTexture7.ofs" "MapFBXASC032FBXASC0356.fs";
connectAttr "MapFBXASC032FBXASC0357.oc" "FBXASC0482FBXASC032FBXASC045FBXASC032Default5.c"
		;
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default5.oc" "BodySG6.ss";
connectAttr "BodySG6.msg" "materialInfo15.sg";
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default5.msg" "materialInfo15.m"
		;
connectAttr "MapFBXASC032FBXASC0357.msg" "materialInfo15.t" -na;
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default5.oc" "BodySG7.ss";
connectAttr "BodySG7.msg" "materialInfo16.sg";
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default5.msg" "materialInfo16.m"
		;
connectAttr "MapFBXASC032FBXASC0357.msg" "materialInfo16.t" -na;
connectAttr "place2dTexture8.o" "MapFBXASC032FBXASC0357.uv";
connectAttr "place2dTexture8.ofu" "MapFBXASC032FBXASC0357.ofu";
connectAttr "place2dTexture8.ofv" "MapFBXASC032FBXASC0357.ofv";
connectAttr "place2dTexture8.rf" "MapFBXASC032FBXASC0357.rf";
connectAttr "place2dTexture8.reu" "MapFBXASC032FBXASC0357.reu";
connectAttr "place2dTexture8.rev" "MapFBXASC032FBXASC0357.rev";
connectAttr "place2dTexture8.vt1" "MapFBXASC032FBXASC0357.vt1";
connectAttr "place2dTexture8.vt2" "MapFBXASC032FBXASC0357.vt2";
connectAttr "place2dTexture8.vt3" "MapFBXASC032FBXASC0357.vt3";
connectAttr "place2dTexture8.vc1" "MapFBXASC032FBXASC0357.vc1";
connectAttr "place2dTexture8.ofs" "MapFBXASC032FBXASC0357.fs";
connectAttr "MapFBXASC032FBXASC0358.oc" "FBXASC0482FBXASC032FBXASC045FBXASC032Default6.c"
		;
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default6.oc" "BodySG8.ss";
connectAttr "BodySG8.msg" "materialInfo17.sg";
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default6.msg" "materialInfo17.m"
		;
connectAttr "MapFBXASC032FBXASC0358.msg" "materialInfo17.t" -na;
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default6.oc" "BodySG9.ss";
connectAttr "BodySG9.msg" "materialInfo18.sg";
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default6.msg" "materialInfo18.m"
		;
connectAttr "MapFBXASC032FBXASC0358.msg" "materialInfo18.t" -na;
connectAttr "place2dTexture9.o" "MapFBXASC032FBXASC0358.uv";
connectAttr "place2dTexture9.ofu" "MapFBXASC032FBXASC0358.ofu";
connectAttr "place2dTexture9.ofv" "MapFBXASC032FBXASC0358.ofv";
connectAttr "place2dTexture9.rf" "MapFBXASC032FBXASC0358.rf";
connectAttr "place2dTexture9.reu" "MapFBXASC032FBXASC0358.reu";
connectAttr "place2dTexture9.rev" "MapFBXASC032FBXASC0358.rev";
connectAttr "place2dTexture9.vt1" "MapFBXASC032FBXASC0358.vt1";
connectAttr "place2dTexture9.vt2" "MapFBXASC032FBXASC0358.vt2";
connectAttr "place2dTexture9.vt3" "MapFBXASC032FBXASC0358.vt3";
connectAttr "place2dTexture9.vc1" "MapFBXASC032FBXASC0358.vc1";
connectAttr "place2dTexture9.ofs" "MapFBXASC032FBXASC0358.fs";
connectAttr "MapFBXASC032FBXASC0359.oc" "FBXASC0482FBXASC032FBXASC045FBXASC032Default7.c"
		;
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default7.oc" "BodySG10.ss";
connectAttr "BodySG10.msg" "materialInfo19.sg";
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default7.msg" "materialInfo19.m"
		;
connectAttr "MapFBXASC032FBXASC0359.msg" "materialInfo19.t" -na;
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default7.oc" "BodySG11.ss";
connectAttr "BodySG11.msg" "materialInfo20.sg";
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default7.msg" "materialInfo20.m"
		;
connectAttr "MapFBXASC032FBXASC0359.msg" "materialInfo20.t" -na;
connectAttr "place2dTexture10.o" "MapFBXASC032FBXASC0359.uv";
connectAttr "place2dTexture10.ofu" "MapFBXASC032FBXASC0359.ofu";
connectAttr "place2dTexture10.ofv" "MapFBXASC032FBXASC0359.ofv";
connectAttr "place2dTexture10.rf" "MapFBXASC032FBXASC0359.rf";
connectAttr "place2dTexture10.reu" "MapFBXASC032FBXASC0359.reu";
connectAttr "place2dTexture10.rev" "MapFBXASC032FBXASC0359.rev";
connectAttr "place2dTexture10.vt1" "MapFBXASC032FBXASC0359.vt1";
connectAttr "place2dTexture10.vt2" "MapFBXASC032FBXASC0359.vt2";
connectAttr "place2dTexture10.vt3" "MapFBXASC032FBXASC0359.vt3";
connectAttr "place2dTexture10.vc1" "MapFBXASC032FBXASC0359.vc1";
connectAttr "place2dTexture10.ofs" "MapFBXASC032FBXASC0359.fs";
connectAttr "MapFBXASC032FBXASC0360.oc" "FBXASC0482FBXASC032FBXASC045FBXASC032Default8.c"
		;
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default8.oc" "BodySG12.ss";
connectAttr "BodySG12.msg" "materialInfo21.sg";
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default8.msg" "materialInfo21.m"
		;
connectAttr "MapFBXASC032FBXASC0360.msg" "materialInfo21.t" -na;
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default8.oc" "BodySG13.ss";
connectAttr "BodySG13.msg" "materialInfo22.sg";
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default8.msg" "materialInfo22.m"
		;
connectAttr "MapFBXASC032FBXASC0360.msg" "materialInfo22.t" -na;
connectAttr "place2dTexture11.o" "MapFBXASC032FBXASC0360.uv";
connectAttr "place2dTexture11.ofu" "MapFBXASC032FBXASC0360.ofu";
connectAttr "place2dTexture11.ofv" "MapFBXASC032FBXASC0360.ofv";
connectAttr "place2dTexture11.rf" "MapFBXASC032FBXASC0360.rf";
connectAttr "place2dTexture11.reu" "MapFBXASC032FBXASC0360.reu";
connectAttr "place2dTexture11.rev" "MapFBXASC032FBXASC0360.rev";
connectAttr "place2dTexture11.vt1" "MapFBXASC032FBXASC0360.vt1";
connectAttr "place2dTexture11.vt2" "MapFBXASC032FBXASC0360.vt2";
connectAttr "place2dTexture11.vt3" "MapFBXASC032FBXASC0360.vt3";
connectAttr "place2dTexture11.vc1" "MapFBXASC032FBXASC0360.vc1";
connectAttr "place2dTexture11.ofs" "MapFBXASC032FBXASC0360.fs";
connectAttr "MapFBXASC032FBXASC0361.oc" "FBXASC0482FBXASC032FBXASC045FBXASC032Default9.c"
		;
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default9.oc" "top001SG.ss";
connectAttr "top001SG.msg" "materialInfo23.sg";
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default9.msg" "materialInfo23.m"
		;
connectAttr "MapFBXASC032FBXASC0361.msg" "materialInfo23.t" -na;
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default9.oc" "top001SG1.ss";
connectAttr "top001SG1.msg" "materialInfo24.sg";
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default9.msg" "materialInfo24.m"
		;
connectAttr "MapFBXASC032FBXASC0361.msg" "materialInfo24.t" -na;
connectAttr "place2dTexture12.o" "MapFBXASC032FBXASC0361.uv";
connectAttr "place2dTexture12.ofu" "MapFBXASC032FBXASC0361.ofu";
connectAttr "place2dTexture12.ofv" "MapFBXASC032FBXASC0361.ofv";
connectAttr "place2dTexture12.rf" "MapFBXASC032FBXASC0361.rf";
connectAttr "place2dTexture12.reu" "MapFBXASC032FBXASC0361.reu";
connectAttr "place2dTexture12.rev" "MapFBXASC032FBXASC0361.rev";
connectAttr "place2dTexture12.vt1" "MapFBXASC032FBXASC0361.vt1";
connectAttr "place2dTexture12.vt2" "MapFBXASC032FBXASC0361.vt2";
connectAttr "place2dTexture12.vt3" "MapFBXASC032FBXASC0361.vt3";
connectAttr "place2dTexture12.vc1" "MapFBXASC032FBXASC0361.vc1";
connectAttr "place2dTexture12.ofs" "MapFBXASC032FBXASC0361.fs";
connectAttr "Global_CTL.msg" "bindPose1.m[0]";
connectAttr "ANM_pelvis_JNT.msg" "bindPose1.m[1]";
connectAttr "ANM_spine1_JNT.msg" "bindPose1.m[2]";
connectAttr "ANM_spine2_JNT.msg" "bindPose1.m[3]";
connectAttr "ANM_neck_JNT.msg" "bindPose1.m[4]";
connectAttr "ANM_head_JNT.msg" "bindPose1.m[5]";
connectAttr "ANM_brain_JNT.msg" "bindPose1.m[6]";
connectAttr "ANM_L_clavicle_JNT.msg" "bindPose1.m[7]";
connectAttr "ANM_L_shoulder_JNT.msg" "bindPose1.m[8]";
connectAttr "ANM_L_elbow_JNT.msg" "bindPose1.m[9]";
connectAttr "ANM_L_wrist_JNT.msg" "bindPose1.m[10]";
connectAttr "ANM_L_hand_JNT.msg" "bindPose1.m[11]";
connectAttr "ANM_L_thumb1_JNT.msg" "bindPose1.m[12]";
connectAttr "ANM_L_thumb2_JNT.msg" "bindPose1.m[13]";
connectAttr "ANM_L_thumb3_JNT.msg" "bindPose1.m[14]";
connectAttr "ANM_L_fingerA1_JNT.msg" "bindPose1.m[15]";
connectAttr "ANM_L_fingerA2_JNT.msg" "bindPose1.m[16]";
connectAttr "ANM_L_fingerA3_JNT.msg" "bindPose1.m[17]";
connectAttr "ANM_L_fingerB1_JNT.msg" "bindPose1.m[18]";
connectAttr "ANM_L_fingerB2_JNT.msg" "bindPose1.m[19]";
connectAttr "ANM_L_fingerB3_JNT.msg" "bindPose1.m[20]";
connectAttr "ANM_R_clavicle_JNT.msg" "bindPose1.m[21]";
connectAttr "ANM_R_shoulder_JNT.msg" "bindPose1.m[22]";
connectAttr "ANM_R_elbow_JNT.msg" "bindPose1.m[23]";
connectAttr "ANM_R_wrist_JNT.msg" "bindPose1.m[24]";
connectAttr "ANM_R_hand_JNT.msg" "bindPose1.m[25]";
connectAttr "ANM_R_thumb1_JNT.msg" "bindPose1.m[26]";
connectAttr "ANM_R_thumb2_JNT.msg" "bindPose1.m[27]";
connectAttr "ANM_R_thumb3_JNT.msg" "bindPose1.m[28]";
connectAttr "ANM_R_fingerA1_JNT.msg" "bindPose1.m[29]";
connectAttr "ANM_R_fingerA2_JNT.msg" "bindPose1.m[30]";
connectAttr "ANM_R_fingerA3_JNT.msg" "bindPose1.m[31]";
connectAttr "ANM_R_fingerB1_JNT.msg" "bindPose1.m[32]";
connectAttr "ANM_R_fingerB2_JNT.msg" "bindPose1.m[33]";
connectAttr "ANM_R_fingerB3_JNT.msg" "bindPose1.m[34]";
connectAttr "ANM_L_thigh_JNT.msg" "bindPose1.m[35]";
connectAttr "ANM_L_kne_JNT.msg" "bindPose1.m[36]";
connectAttr "ANM_L_ankle_JNT.msg" "bindPose1.m[37]";
connectAttr "ANM_L_ball_JNT.msg" "bindPose1.m[38]";
connectAttr "ANM_L_toe_JNT.msg" "bindPose1.m[39]";
connectAttr "ANM_R_thigh_JNT.msg" "bindPose1.m[40]";
connectAttr "ANM_R_kne_JNT.msg" "bindPose1.m[41]";
connectAttr "ANM_R_ankle_JNT.msg" "bindPose1.m[42]";
connectAttr "ANM_R_ball_JNT.msg" "bindPose1.m[43]";
connectAttr "ANM_R_toe_JNT.msg" "bindPose1.m[44]";
connectAttr "bindPose1.w" "bindPose1.p[0]";
connectAttr "bindPose1.m[0]" "bindPose1.p[1]";
connectAttr "bindPose1.m[1]" "bindPose1.p[2]";
connectAttr "bindPose1.m[2]" "bindPose1.p[3]";
connectAttr "bindPose1.m[3]" "bindPose1.p[4]";
connectAttr "bindPose1.m[4]" "bindPose1.p[5]";
connectAttr "bindPose1.m[5]" "bindPose1.p[6]";
connectAttr "bindPose1.m[3]" "bindPose1.p[7]";
connectAttr "bindPose1.m[7]" "bindPose1.p[8]";
connectAttr "bindPose1.m[8]" "bindPose1.p[9]";
connectAttr "bindPose1.m[9]" "bindPose1.p[10]";
connectAttr "bindPose1.m[10]" "bindPose1.p[11]";
connectAttr "bindPose1.m[11]" "bindPose1.p[12]";
connectAttr "bindPose1.m[12]" "bindPose1.p[13]";
connectAttr "bindPose1.m[13]" "bindPose1.p[14]";
connectAttr "bindPose1.m[11]" "bindPose1.p[15]";
connectAttr "bindPose1.m[15]" "bindPose1.p[16]";
connectAttr "bindPose1.m[16]" "bindPose1.p[17]";
connectAttr "bindPose1.m[11]" "bindPose1.p[18]";
connectAttr "bindPose1.m[18]" "bindPose1.p[19]";
connectAttr "bindPose1.m[19]" "bindPose1.p[20]";
connectAttr "bindPose1.m[3]" "bindPose1.p[21]";
connectAttr "bindPose1.m[21]" "bindPose1.p[22]";
connectAttr "bindPose1.m[22]" "bindPose1.p[23]";
connectAttr "bindPose1.m[23]" "bindPose1.p[24]";
connectAttr "bindPose1.m[24]" "bindPose1.p[25]";
connectAttr "bindPose1.m[25]" "bindPose1.p[26]";
connectAttr "bindPose1.m[26]" "bindPose1.p[27]";
connectAttr "bindPose1.m[27]" "bindPose1.p[28]";
connectAttr "bindPose1.m[25]" "bindPose1.p[29]";
connectAttr "bindPose1.m[29]" "bindPose1.p[30]";
connectAttr "bindPose1.m[30]" "bindPose1.p[31]";
connectAttr "bindPose1.m[25]" "bindPose1.p[32]";
connectAttr "bindPose1.m[32]" "bindPose1.p[33]";
connectAttr "bindPose1.m[33]" "bindPose1.p[34]";
connectAttr "bindPose1.m[1]" "bindPose1.p[35]";
connectAttr "bindPose1.m[35]" "bindPose1.p[36]";
connectAttr "bindPose1.m[36]" "bindPose1.p[37]";
connectAttr "bindPose1.m[37]" "bindPose1.p[38]";
connectAttr "bindPose1.m[38]" "bindPose1.p[39]";
connectAttr "bindPose1.m[1]" "bindPose1.p[40]";
connectAttr "bindPose1.m[40]" "bindPose1.p[41]";
connectAttr "bindPose1.m[41]" "bindPose1.p[42]";
connectAttr "bindPose1.m[42]" "bindPose1.p[43]";
connectAttr "bindPose1.m[43]" "bindPose1.p[44]";
connectAttr "ANM_pelvis_JNT.bps" "bindPose1.wm[1]";
connectAttr "ANM_spine1_JNT.bps" "bindPose1.wm[2]";
connectAttr "ANM_spine2_JNT.bps" "bindPose1.wm[3]";
connectAttr "ANM_neck_JNT.bps" "bindPose1.wm[4]";
connectAttr "ANM_head_JNT.bps" "bindPose1.wm[5]";
connectAttr "ANM_brain_JNT.bps" "bindPose1.wm[6]";
connectAttr "ANM_L_clavicle_JNT.bps" "bindPose1.wm[7]";
connectAttr "ANM_L_shoulder_JNT.bps" "bindPose1.wm[8]";
connectAttr "ANM_L_elbow_JNT.bps" "bindPose1.wm[9]";
connectAttr "ANM_L_wrist_JNT.bps" "bindPose1.wm[10]";
connectAttr "ANM_L_hand_JNT.bps" "bindPose1.wm[11]";
connectAttr "ANM_L_thumb1_JNT.bps" "bindPose1.wm[12]";
connectAttr "ANM_L_thumb2_JNT.bps" "bindPose1.wm[13]";
connectAttr "ANM_L_thumb3_JNT.bps" "bindPose1.wm[14]";
connectAttr "ANM_L_fingerA1_JNT.bps" "bindPose1.wm[15]";
connectAttr "ANM_L_fingerA2_JNT.bps" "bindPose1.wm[16]";
connectAttr "ANM_L_fingerA3_JNT.bps" "bindPose1.wm[17]";
connectAttr "ANM_L_fingerB1_JNT.bps" "bindPose1.wm[18]";
connectAttr "ANM_L_fingerB2_JNT.bps" "bindPose1.wm[19]";
connectAttr "ANM_L_fingerB3_JNT.bps" "bindPose1.wm[20]";
connectAttr "ANM_R_clavicle_JNT.bps" "bindPose1.wm[21]";
connectAttr "ANM_R_shoulder_JNT.bps" "bindPose1.wm[22]";
connectAttr "ANM_R_elbow_JNT.bps" "bindPose1.wm[23]";
connectAttr "ANM_R_wrist_JNT.bps" "bindPose1.wm[24]";
connectAttr "ANM_R_hand_JNT.bps" "bindPose1.wm[25]";
connectAttr "ANM_R_thumb1_JNT.bps" "bindPose1.wm[26]";
connectAttr "ANM_R_thumb2_JNT.bps" "bindPose1.wm[27]";
connectAttr "ANM_R_thumb3_JNT.bps" "bindPose1.wm[28]";
connectAttr "ANM_R_fingerA1_JNT.bps" "bindPose1.wm[29]";
connectAttr "ANM_R_fingerA2_JNT.bps" "bindPose1.wm[30]";
connectAttr "ANM_R_fingerA3_JNT.bps" "bindPose1.wm[31]";
connectAttr "ANM_R_fingerB1_JNT.bps" "bindPose1.wm[32]";
connectAttr "ANM_R_fingerB2_JNT.bps" "bindPose1.wm[33]";
connectAttr "ANM_R_fingerB3_JNT.bps" "bindPose1.wm[34]";
connectAttr "ANM_L_thigh_JNT.bps" "bindPose1.wm[35]";
connectAttr "ANM_L_kne_JNT.bps" "bindPose1.wm[36]";
connectAttr "ANM_L_ankle_JNT.bps" "bindPose1.wm[37]";
connectAttr "ANM_L_ball_JNT.bps" "bindPose1.wm[38]";
connectAttr "ANM_L_toe_JNT.bps" "bindPose1.wm[39]";
connectAttr "ANM_R_thigh_JNT.bps" "bindPose1.wm[40]";
connectAttr "ANM_R_kne_JNT.bps" "bindPose1.wm[41]";
connectAttr "ANM_R_ankle_JNT.bps" "bindPose1.wm[42]";
connectAttr "ANM_R_ball_JNT.bps" "bindPose1.wm[43]";
connectAttr "ANM_R_toe_JNT.bps" "bindPose1.wm[44]";
connectAttr "baldr1:wire_224198087.pa" ":renderPartition.st" -na;
connectAttr "baldr1:default1.pa" ":renderPartition.st" -na;
connectAttr "lambert2SG.pa" ":renderPartition.st" -na;
connectAttr "lambert3SG.pa" ":renderPartition.st" -na;
connectAttr "balder:default1.pa" ":renderPartition.st" -na;
connectAttr "Objekt003SG.pa" ":renderPartition.st" -na;
connectAttr "Objekt003SG1.pa" ":renderPartition.st" -na;
connectAttr "Objekt003SG2.pa" ":renderPartition.st" -na;
connectAttr "Objekt003SG3.pa" ":renderPartition.st" -na;
connectAttr "IdunSG.pa" ":renderPartition.st" -na;
connectAttr "IdunSG1.pa" ":renderPartition.st" -na;
connectAttr "BodySG.pa" ":renderPartition.st" -na;
connectAttr "BodySG1.pa" ":renderPartition.st" -na;
connectAttr "BodySG2.pa" ":renderPartition.st" -na;
connectAttr "BodySG3.pa" ":renderPartition.st" -na;
connectAttr "BodySG4.pa" ":renderPartition.st" -na;
connectAttr "BodySG5.pa" ":renderPartition.st" -na;
connectAttr "BodySG6.pa" ":renderPartition.st" -na;
connectAttr "BodySG7.pa" ":renderPartition.st" -na;
connectAttr "BodySG8.pa" ":renderPartition.st" -na;
connectAttr "BodySG9.pa" ":renderPartition.st" -na;
connectAttr "BodySG10.pa" ":renderPartition.st" -na;
connectAttr "BodySG11.pa" ":renderPartition.st" -na;
connectAttr "BodySG12.pa" ":renderPartition.st" -na;
connectAttr "BodySG13.pa" ":renderPartition.st" -na;
connectAttr "top001SG.pa" ":renderPartition.st" -na;
connectAttr "top001SG1.pa" ":renderPartition.st" -na;
connectAttr "baldr1:wire_224198088.msg" ":defaultShaderList1.s" -na;
connectAttr "baldr1:default2.msg" ":defaultShaderList1.s" -na;
connectAttr "lambert2.msg" ":defaultShaderList1.s" -na;
connectAttr "lambert3.msg" ":defaultShaderList1.s" -na;
connectAttr "balder:default2.msg" ":defaultShaderList1.s" -na;
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default1.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "FBXASC0488___Default.msg" ":defaultShaderList1.s" -na;
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default2.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default3.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default4.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default5.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default6.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default7.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default8.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default9.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "file1.msg" ":defaultTextureList1.tx" -na;
connectAttr "file2.msg" ":defaultTextureList1.tx" -na;
connectAttr "MapFBXASC032FBXASC0353.msg" ":defaultTextureList1.tx" -na;
connectAttr "MapFBXASC032FBXASC0350.msg" ":defaultTextureList1.tx" -na;
connectAttr "MapFBXASC032FBXASC0354.msg" ":defaultTextureList1.tx" -na;
connectAttr "MapFBXASC032FBXASC0355.msg" ":defaultTextureList1.tx" -na;
connectAttr "MapFBXASC032FBXASC0356.msg" ":defaultTextureList1.tx" -na;
connectAttr "MapFBXASC032FBXASC0357.msg" ":defaultTextureList1.tx" -na;
connectAttr "MapFBXASC032FBXASC0358.msg" ":defaultTextureList1.tx" -na;
connectAttr "MapFBXASC032FBXASC0359.msg" ":defaultTextureList1.tx" -na;
connectAttr "MapFBXASC032FBXASC0360.msg" ":defaultTextureList1.tx" -na;
connectAttr "MapFBXASC032FBXASC0361.msg" ":defaultTextureList1.tx" -na;
connectAttr "place2dTexture1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture7.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture8.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture9.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture10.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture11.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture12.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "ikRPsolver.msg" ":ikSystem.sol" -na;
connectAttr "ikRPsolver1.msg" ":ikSystem.sol" -na;
// End of stand_sit.ma
