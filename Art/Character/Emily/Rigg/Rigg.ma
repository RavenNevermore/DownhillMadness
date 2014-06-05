//Maya ASCII 2014 scene
//Name: Rigg.ma
//Last modified: Thu, Jun 05, 2014 10:37:07 PM
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
	setAttr ".t" -type "double3" -76.564450319989561 46.409343117394016 -92.872409771736812 ;
	setAttr ".r" -type "double3" 168.60000000000304 -35.999999999978186 -180 ;
	setAttr ".rp" -type "double3" -4.6185277824406512e-014 7.1054273576010019e-015 -4.5474735088646412e-013 ;
	setAttr ".rpt" -type "double3" -2.6957009029725026e-013 -7.3605989133326919e-014 
		-4.7891301003338836e-015 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999979;
	setAttr ".coi" 144.57862738034373;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" -18.209862546562718 6.557405422530184e-015 29.531928617424214 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -1.8553786209998824 100.1 -2.5687056597937641 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v" no;
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
	setAttr ".ow" 14.839756472813043;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 100.1 2.2902490663942365 1.5344100350255907 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 12.708197684482764;
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
createNode transform -n "Controllers";
createNode transform -n "Global_CTL" -p "Controllers";
	setAttr ".ove" yes;
createNode nurbsCurve -n "Global_CTLShape" -p "Global_CTL";
	setAttr -k off ".v";
	setAttr ".tw" yes;
createNode transform -n "L_foot_CTL_GRP" -p "Global_CTL";
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
	setAttr ".tw" yes;
	setAttr -s 11 ".cp[3:10]" -type "double3" 1.3835120869173725 0 0 -0.84597374858308916 
		0 0 1.5948928755049684e-017 0 0 0.84597374858308916 0 0 -1.3835120869173725 0 0 0 
		0 0 0 0 0 0 0 0;
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
	setAttr ".jo" -type "double3" -179.99999999959061 2.6144159619531179e-012 179.99910970384207 ;
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
	setAttr ".r" -type "double3" -33.067487161360916 -89.999999999723514 0 ;
	setAttr ".s" -type "double3" 0.99999999999999989 1 0.99999999999999989 ;
	setAttr ".pv" -type "double3" 9.9920072216264089e-016 -2 8.0363419641785805e-012 ;
	setAttr ".roc" yes;
createNode ikHandle -n "L_toe_IK" -p "L_invToe_JNT";
	setAttr ".t" -type "double3" 1.7763568394002505e-015 -1.1222475043443788e-015 4.5208281562736374e-013 ;
	setAttr ".r" -type "double3" -0.00089029615794363034 -89.999999999723514 0 ;
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
createNode transform -n "R_foot_CTL_GRP" -p "Global_CTL";
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
	setAttr ".tw" yes;
	setAttr -s 11 ".cp[3:10]" -type "double3" 1.3835120869173725 0 0 -0.84597374858308916 
		0 0 1.5948928755049684e-017 0 0 0.84597374858308916 0 0 -1.3835120869173725 0 0 0 
		0 0 0 0 0 0 0 0;
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
	setAttr ".jo" -type "double3" -179.99999999959061 2.6144159619531179e-012 179.99910970384207 ;
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
	setAttr ".t" -type "double3" 0.005534084117796656 -1.6530776747458734e-011 3.0668245720733012e-012 ;
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
	setAttr ".t" -type "double3" -5.0233780406472306e-006 1.231849471317048e-005 0.0055341279494749429 ;
	setAttr ".r" -type "double3" -33.067487161360916 -89.999999999723514 0 ;
	setAttr ".s" -type "double3" 0.99999999999999989 1 0.99999999999999989 ;
	setAttr ".pv" -type "double3" -1.1182172087176312e-005 -1.9999999999687397 -8.7610621906697201e-009 ;
	setAttr ".roc" yes;
createNode ikHandle -n "R_toe_IK" -p "R_invToe_JNT";
	setAttr ".t" -type "double3" -1.0930886870319512e-005 1.7001482568160079e-005 0.0055341392146339707 ;
	setAttr ".r" -type "double3" -0.00089029615794363002 -89.999999999723514 0 ;
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
createNode transform -n "pelvis_CTL_GRP" -p "Global_CTL";
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
	setAttr ".tw" yes;
	setAttr -s 11 ".cp[1:10]" -type "double3" 11.381554998651094 -9.855926480459247e-016 
		11.381554998651088 0 0 0 11.381554998651088 -3.6042981449059856e-031 -11.381554998651072 
		0 0 0 -11.381554998651072 9.855926480459247e-016 -11.381554998651078 0 0 0 -11.381554998651078 
		4.5453401122692819e-031 11.381554998651078 0 0 0 0 0 0 0 0 0;
createNode transform -n "spine_CTL_GRP" -p "pelvis_CTL";
	setAttr ".t" -type "double3" -3.0566424650183748e-017 3.7359913749200895 0.07186931591239043 ;
createNode transform -n "Spine_CTL" -p "spine_CTL_GRP";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 0 3.5527136788005009e-015 0 ;
	setAttr -k off -cb on ".tx";
	setAttr -k off -cb on ".ty";
	setAttr -av -k off -cb on ".tz";
	setAttr ".r" -type "double3" 0 0 0 ;
	setAttr -av ".rx";
	setAttr -av ".ry";
	setAttr -av ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "Spine_CTLShape" -p "Spine_CTL";
	setAttr -k off ".v";
	setAttr ".tw" yes;
	setAttr -s 11 ".cp[1:10]" -type "double3" 0 0 1.8148013605732851 0 
		0 0 0 0 0 0 0 0 0 0 -1.814801360573284 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
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
	setAttr ".tw" yes;
	setAttr -s 11 ".cp[1:10]" -type "double3" 0 0 -5.9599890038819874 0 
		0 0 3.3852414287737278 0 0 0 0 0 0 0 5.95998900388199 0 0 0 -3.3852414287737278 0 
		0 0 0 0 0 0 0 0 0 0;
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
	setAttr ".tw" yes;
createNode ikHandle -n "R_wrist_IK" -p "R_wrist_CTL";
	setAttr ".t" -type "double3" 1 -0.25587973078323856 1.4793868852169823e-008 ;
	setAttr ".rp" -type "double3" -11.782000000000007 3.7641808430410784 -0.21952982960827999 ;
	setAttr ".sp" -type "double3" -11.782000000000007 3.7641808430410784 -0.21952982960827999 ;
	setAttr ".pv" -type "double3" -0.0031102842111285015 0.15818046044726006 -1.9937324966165946 ;
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
	setAttr ".tw" yes;
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
	setAttr ".t" -type "double3" 0 0 2.1710069140379454e-015 ;
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
	setAttr ".tw" yes;
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
	setAttr ".rp" -type "double3" 0.003477626609308615 27.398463363990654 -6.2475633711059126 ;
	setAttr ".sp" -type "double3" 0.003477626609308615 27.398463363990654 -6.2475633711059126 ;
	setAttr -k on ".IK_FK_Blend";
createNode nurbsCurve -n "L_IKFK_BlendShape" -p "L_IKFK_Blend";
	setAttr -k off ".v";
	setAttr ".tw" yes;
	setAttr -s 11 ".cp[0:10]" -type "double3" -7.9999955690949971 24.128985721853823 
		-3.2590098000148329 -7.9999955690949971 18.982468930249205 -3.2590098000148315 -7.9999955690949971 
		24.128985721853823 -3.2590098000148329 -8.5916152982668699 23.356392632294092 -3.2590098000148329 
		-7.9999955690949971 22.583799542734361 -3.2590098000148329 -7.999995569094998 27.73031633433898 
		-3.2590098000148342 -7.9999955690949971 22.583799542734361 -3.2590098000148329 -7.4083758399231234 
		23.356392632294092 -3.2590098000148329 0 0 0 0 0 0 0 0 0;
createNode transform -n "neck_CTL_GRP" -p "breast_CTL";
	setAttr ".t" -type "double3" 2.4086569201433078e-016 2.8022394081709123 -0.54528983658817287 ;
createNode transform -n "neck_CTL" -p "neck_CTL_GRP";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 0 0 0 ;
	setAttr -av ".ry";
	setAttr -av ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode nurbsCurve -n "neck_CTLShape" -p "neck_CTL";
	setAttr -k off ".v";
	setAttr ".tw" yes;
	setAttr -s 11 ".cp[0:10]" -type "double3" 1.3765534215871795 0 -1.0947272280505234 
		0 -0.10648001738599865 -1.4952707966246086 -1.3765534215871753 0 -1.0947272280505207 
		0 0 0 -1.3765534215871746 0 1.0947272280505234 0 -0.10648001738599938 1.4952707966246086 
		1.376553421587184 0 1.0947272280505191 0 0 0 0 0 0 0 0 0 0 0 0;
createNode transform -n "head_CTL_GRP" -p "neck_CTL";
	setAttr ".t" -type "double3" 1.0046130365440645e-018 1.2072579547915865 -0.026169436433599091 ;
createNode transform -n "head_CTL" -p "head_CTL_GRP";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 0 0 0 ;
	setAttr -av ".rz";
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
createNode joint -n "ANM_pelvis_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -90 -18.8384 90 ;
	setAttr ".bps" -type "matrix" 0 0.94643306298349272 0.32290007322960507 0 -1.6653345369377348e-016 0.3229000732296049 -0.94643306298349272 0
		 -1.0000000000000002 5.5511151231257827e-017 1.1102230246251565e-016 0 1.424802394356005e-016 12.229527782038836 0.48709851369588908 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_spine1_JNT" -p "ANM_pelvis_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 179.99999999999997 1.5978918042954642e-014 19.972855188957741 ;
	setAttr ".bps" -type "matrix" -7.7086472027692958e-017 0.9995601563363381 0.029656261815596829 0
		 -4.0672286895455672e-016 -0.029656261815596718 0.99956015633633832 0 1.0000000000000002 -4.4294129480845729e-017 4.5542053528077671e-016 0
		 1.11913814785417e-016 15.96551915695893 -0.11557147717855776 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_spine2_JNT" -p "ANM_spine1_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 2;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 3.5311250384401286e-031 -1.7655625192200643e-031 -12.614627352442346 ;
	setAttr ".bps" -type "matrix" 1.3599491224817693e-017 0.98190851450369798 -0.18935593242658447 0
		 -4.1374009974708511e-016 0.18935593242658452 0.9819085145036982 0 1.0000000000000002 -4.4294129480845729e-017 4.5542053528077671e-016 0
		 -7.5077552276662952e-017 19.368565278661837 0.50872496849020521 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_neck_JNT" -p "ANM_spine2_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 3.2728397933726192e-016 -3.7584013621163934e-015 -9.9535969675468863 ;
	setAttr ".bps" -type "matrix" -0.0035109185420983792 0.93464238009965472 -0.35557178568137737 0
		 0.015324691219764978 0.35558250950791248 0.93451925222066701 0 0.99987640600726746 -0.0021680068514582174 -0.015571527101810581 0
		 1.4468050304368782e-016 22.194337117846139 0.10264588818025511 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_head_JNT" -p "ANM_neck_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 4;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 180 -3.1643061752246035e-015 25.250803649944196 ;
	setAttr ".bps" -type "matrix" 0.0033617813005023581 0.99702141159335467 0.077051951635777438 0
		 -0.015358096772646698 0.077094776546057953 -0.9969054741011486 0 -0.99987640600726746 0.0021680068514582269 0.015571527101810459 0
		 0.0031519936340188588 23.401386203374084 0.136985062210703 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_brain_JNT" -p "ANM_head_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" 7.2470168697665036 0.57724365801492583 -3.5071498530125067e-016 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 88.45184230102204 89.999999999999972 0 ;
	setAttr ".bps" -type "matrix" 0.99987640600726746 -0.0021680068514577842 -0.015571527101810425 0
		 0.0029456219705428677 0.99874035075773915 0.050090269309664738 0 0.015443316392441125 -0.050129946285629653 0.9986232985786998 0
		 0.018649515470035568 30.671319663536828 0.11992449299836389 1;
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
	setAttr ".lr" -type "double3" -3.9116271765617533e-014 -5.5964548248510765e-014 
		-6.361109362927013e-015 ;
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
	setAttr ".tg[0].tot" -type "double3" -2.4651903288156623e-031 -1.0658141036401504e-014 
		6.6613381477509392e-016 ;
	setAttr ".tg[0].tor" -type "double3" 89.999999999999972 23.702679508946986 90 ;
	setAttr ".lr" -type "double3" -4.0781969840557746e-014 2.8374590532341331e-014 -2.067360542951287e-014 ;
	setAttr ".rst" -type "double3" 2.8515429118308586 0.13634415491535901 2.0005427124054233e-016 ;
	setAttr ".rsrr" -type "double3" -2.6452191784224495e-014 1.0466890481559725e-014 
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
	setAttr ".bps" -type "matrix" 1.0000000000000004 -4.4294129480845742e-017 4.5542053528077681e-016 0
		 -1.9614624231307401e-016 0.99877707441277519 0.049440425033147328 0 -4.0511693517380925e-016 -0.049440425033147439 0.99877707441277541 0
		 1.221941388389608 19.501671988383482 1.284146248040583 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_L_shoulder_JNT" -p "ANM_L_clavicle_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 4;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 4.706602733438673e-015 1.0182036531237233e-015 -4.3987053549955082 ;
	setAttr ".bps" -type "matrix" 0.36174563532232235 -0.28541163608166753 0.88751354542589167 0
		 0.0081415368209594337 0.95291582526696295 0.3031256263234377 0 -0.93224128352237401 -0.10242864806766347 0.34703682996418161 0
		 4.3940544309050038 20.02778958281711 -0.12256474150187024 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_L_elbow_JNT" -p "ANM_L_shoulder_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" 4.0274932330323416 0.18455340648272056 -0.44478080535892311 ;
	setAttr ".r" -type "double3" 0.11437621851545354 2.58909481336753 0.21994033436911212 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 4.6925272896462529 ;
	setAttr ".bps" -type "matrix" -0.43651701975910773 -0.25851588494626232 0.86175543438441904 0
		 0.035311858656159961 0.9521686811522122 0.30352574070596516 0 -0.89900276089613607 0.16292433784830407 -0.40650915861492909 0
		 6.2671281064728728 19.099718308093177 3.3534776031349725 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_L_wrist_JNT" -p "ANM_L_elbow_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 3.3572489402465528 -0.18509618328430119 0.43307604732316229 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -3.1156889362419622 ;
	setAttr ".bps" -type "matrix" -0.20729833279780038 -0.34009626668722881 0.91725783213045542 0
		 0.011533986404818172 0.93671029322303245 0.34991540938866117 0 -0.97820977728545877 0.083116520352035123 -0.19025581638337341 0
		 4.4057591520035864 18.126131966844405 6.0143742862269391 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_L_hand_JNT" -p "ANM_L_wrist_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 7;
	setAttr ".t" -type "double3" 0.91521086438699917 -0.077633468193193805 -0.0036034131304154993 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 77.770647009000257 ;
	setAttr ".bps" -type "matrix" -0.032638822590001199 0.84341293423780828 0.53627355856904735 0
		 0.20503740849677302 0.5307977641295607 -0.82232195319837331 0 -0.97820977728545877 0.083116520352035123 -0.19025581638337341 0
		 4.2186669362467999 17.741852596718836 6.8273790431386088 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_L_thumb1_JNT" -p "ANM_L_hand_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".t" -type "double3" 0.94102488066337886 0.29847053014153269 0.12738552651631807 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -37.634307155790616 ;
	setAttr ".bps" -type "matrix" -0.97820977728545877 0.083116520352035067 -0.19025581638337333 0
		 0.1424441780137746 0.93535592217364938 -0.32375755590358485 0 0.15104730309778525 -0.3438036400319992 -0.926813772733031 0
		 4.1245408486040098 18.704540484274858 7.0623510979330453 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_L_thumb2_JNT" -p "ANM_L_thumb1_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" 0.73642750578698324 0.0003185173538346179 0.023161004821148336 ;
	setAttr ".jo" -type "double3" 0 0 2.4047344882090154 ;
	setAttr ".bps" -type "matrix" -0.86197709247039267 -0.50478510527088116 0.046770605650924224 0
		 -0.48392169230483439 0.7918276672341108 -0.37259729081061832 0 0.15104730309778525 -0.3438036400319992 -0.926813772733031 0
		 3.4077040404391585 18.758084865376315 6.9006724209538044 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_L_thumb3_JNT" -p "ANM_L_thumb2_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 0.90103318856088277 0.00038075217441590716 0.023161004821148225 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -2.4047344882090185 ;
	setAttr ".bps" -type "matrix" -0.84091351679341686 -0.53756424887308685 0.062362934565673628 0
		 -0.51966255349121937 0.76995047596209865 -0.37030675805975272 0 0.15104730309778525 -0.3438036400319992 -0.926813772733031 0
		 2.6343482254227988 18.295595384777805 6.9212064834071461 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_L_fingerA1_JNT" -p "ANM_L_hand_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".t" -type "double3" 0.42397349582730443 -0.65690366521336552 -0.092690460224575361 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -64.643933538642912 ;
	setAttr ".bps" -type "matrix" -0.87743546039391984 -0.012485024056465441 0.47953220644459388 0
		 0.05831117368652701 0.9894719237330929 0.13245799019776916 0 -0.47613739599679705 0.14418542339030732 -0.8674697365413665 0
		 4.1608098298390184 17.74305022160614 7.6125660227072789 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_L_fingerA2_JNT" -p "ANM_L_fingerA1_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" 0.84911705038024765 -0.062229517682030389 0.012797058404320714 ;
	setAttr ".jo" -type "double3" 0 0 -0.21185123783486104 ;
	setAttr ".bps" -type "matrix" -0.92888178154049217 0.10007559774808827 -0.35659993081536789 0
		 0.055066463437972522 0.98941899665751487 0.13423015182018966 0 0.36625990843470307 0.10504724550696047 -0.92456408954966673 0
		 3.4060425855312606 17.672719763515744 8.0004011376802051 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_L_fingerA3_JNT" -p "ANM_L_fingerA2_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 1.042059164696707 0.00073208636073891092 0.14076764244752088 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 0.21185123783486079 ;
	setAttr ".bps" -type "matrix" -0.92867182406151894 0.10373328366785578 -0.35610117811337871 0
		 0.058500621087774124 0.98904220439316171 0.13554776007540689 0 0.36625990843470307 0.10504724550696047 -0.92456408954966673 0
		 2.4896906693974015 17.792516050559769 7.4987524725296417 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_L_fingerB1_JNT" -p "ANM_L_hand_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".t" -type "double3" -0.20184749556034115 -0.86610446256733153 -0.092690460224575277 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -90.856331937934655 ;
	setAttr ".bps" -type "matrix" -0.88081940108203871 -0.28558352288801048 0.37762313770789169 0
		 -0.035699513705921379 0.83538582819931828 0.54850347561788582 0 -0.4721045725246058 0.46965154050488667 -0.74601923775647194 0
		 4.1383419008051021 17.104181387462667 7.4489851809193874 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_L_fingerB2_JNT" -p "ANM_L_fingerB1_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" 0.88011046274983185 -0.054229413530510209 0.012797058404320443 ;
	setAttr ".bps" -type "matrix" -0.92783288174058764 0.17620440276299076 -0.3287524174936145 0
		 -0.035699513705921379 0.83538582819931828 0.54850347561788582 0 0.37128383789510527 0.52065586186143886 -0.76880802885193966 0
		 3.3590179440238117 16.813544015638545 7.7420433818340024 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_L_fingerB3_JNT" -p "ANM_L_fingerB2_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 0.94274160571279697 0.0028027984697867386 0.14076764244752096 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 90.856331937934655 ;
	setAttr ".bps" -type "matrix" -0.021828827175440418 0.83265910702501489 0.55335550398676825 0
		 0.9282627936215192 -0.18866977764768755 0.32051817574101188 0 0.37128383789510527 0.52065586186143886 -0.76880802885193966 0
		 2.536475975255533 17.055292153554667 7.32542885087003 1;
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
	setAttr ".bps" -type "matrix" 1.0000000000000004 -4.4294129480845742e-017 4.5542053528077681e-016 0
		 -1.9614624231307401e-016 0.99877707441277519 0.049440425033147328 0 -4.0511693517380925e-016 -0.049440425033147439 0.99877707441277541 0
		 -1.2219999999999993 19.501671988383485 1.2841462480405823 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_R_shoulder_JNT" -p "ANM_R_clavicle_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 4;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 2.8639142738458516e-016 4.3987053549955908 ;
	setAttr ".bps" -type "matrix" 0.36466313647131759 0.29307224075601113 -0.88381528533803533 0
		 0.0082013428714862256 -0.95015011882175604 -0.31168492051767249 0 -0.93110339644639173 0.10641152851667032 -0.34888830838069163 0
		 -4.39405 20.027813562228456 -0.12256329525376031 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_R_elbow_JNT" -p "ANM_R_shoulder_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" -4.0274995878401239 -0.18453867900157303 0.4447811000000001 ;
	setAttr ".r" -type "double3" -2.1325511709957952 -47.500586393975219 -3.7724041980260723 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 1.2074182697492533e-006 5.9242447492918327e-024 4.6925272896463301 ;
	setAttr ".bps" -type "matrix" -0.44007056878577444 0.26611653069873986 -0.85762456038608936 0
		 0.035757099046470842 -0.9491268713713078 -0.3128571749356156 0 -0.89725098180851659 -0.16834540127303799 0.40816724698813578 0
		 -6.2783812897034235 19.070134517863121 3.3393414000903165 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_R_wrist_JNT" -p "ANM_R_elbow_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" -3.3572548292865605 0.18511889004937743 -0.43307610390108919 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 1.9108806861092654e-006 -5.9242447492918312e-024 -3.1156889362418898 ;
	setAttr ".bps" -type "matrix" -0.17282604958515418 0.35172893828153917 -0.92000973394857755 0
		 0.011785395399775597 -0.93325987330893712 -0.35900851428156699 0 -0.9848818513101264 -0.072888701776944662 0.1571463525291337 0
		 -4.4057549735105708 18.073918567570487 5.9839223431275581 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_R_hand_JNT" -p "ANM_R_wrist_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 7;
	setAttr ".t" -type "double3" -0.92353661016121236 0.07752741275754646 0.0035012888287024452 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 5.402704657695632e-006 3.0318914631415203e-006 77.770647009000143 ;
	setAttr ".bps" -type "matrix" -0.025090957774353759 -0.83757671257461597 -0.5457432495145178 0
		 0.17140054943566826 -0.54143558129060598 0.82308527077433236 0 -0.98488186880006967 -0.072888695043903745 0.1571462460375051 0
		 -4.2486784541390588 17.676475588409005 6.8063022276321474 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_R_thumb1_JNT" -p "ANM_R_hand_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".t" -type "double3" -0.94177244551957084 -0.29549915213612249 -0.1274242361542626 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 7.4904463094196113e-006 -3.7412644997371746e-006 -37.634307155790445 ;
	setAttr ".bps" -type "matrix" -0.98488187641076941 -0.072888550403084257 0.15714626542727589 0
		 0.12041508090693982 -0.94021656565694356 0.31857968854658369 0 0.12453071029982127 0.33268614170776617 0.93477913611067676 0
		 -4.1501993786753513 18.634563798818597 7.0570229423378477 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_R_thumb2_JNT" -p "ANM_R_thumb1_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" -0.736861425573754 9.7470251283216403e-005 -0.023168048703514625 ;
	setAttr ".jo" -type "double3" 1.2412647844422111e-005 5.1787195570902763e-007 2.404734488208959 ;
	setAttr ".bps" -type "matrix" -0.85382417642215713 0.51585446913378419 -0.069845847634114097 0
		 -0.50544671991267731 -0.78943901779731041 0.3482953495364729 0 0.12453067528340746 0.33268634455582946 0.93477906858227178 0
		 -3.427351311874673 18.680473228097632 6.9196019646613687 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_R_thumb3_JNT" -p "ANM_R_thumb2_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" -0.90149585114628239 -2.7279365413070375e-005 -0.023168040522504645 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 2.4785082598098663e-005 -5.2081252849461597e-007 -2.4047344882089585 ;
	setAttr ".bps" -type "matrix" -0.83186462877277523 0.54852364121918717 -0.084398189674768712 0
		 -0.54082648977456427 -0.76709933540389319 0.34505842632955486 0 0.12453090923484335 0.33268667638868576 0.93477891931653767 0
		 -2.6605037026871985 18.207746409061741 6.960901205906703 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_R_fingerA1_JNT" -p "ANM_R_hand_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".t" -type "double3" -0.42341465003819889 0.65460344263820203 0.092718579793075989 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 9.7187242771388851e-006 -5.5367475458294882e-006 -64.643933538642756 ;
	setAttr ".bps" -type "matrix" -0.86093050258489023 0.028105762014718073 -0.50794560324950333 0
		 0.050727012443791936 -0.98875351685328983 -0.1406884967535692 0 -0.50618715899107591 -0.14688958115476988 0.84982234085761743 0
		 -4.217172033442333 17.669934107276845 7.5907427432221315 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_R_fingerA2_JNT" -p "ANM_R_fingerA1_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" -0.8494643361083527 0.062261074007946289 -0.012800963733368457 ;
	setAttr ".jo" -type "double3" 1.2401862938154068e-005 -4.563654822853677e-008 -0.2118512378331357 ;
	setAttr ".bps" -type "matrix" -0.94127410822890667 -0.092107898109628689 0.32483717195497169 0
		 0.047543271442058728 -0.98864286891090813 -0.14256547650885226 0 0.33427935999469738 -0.11874936992437336 0.93496304559276644 0
		 -3.4762042738881225 17.586378737118945 8.0025864559920628 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_R_fingerA3_JNT" -p "ANM_R_fingerA2_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" -1.0454763170459267 1.6111734672301682e-005 -0.14081045437276477 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 2.4774236379414391e-005 4.5855803875850957e-008 0.21185123783141524 ;
	setAttr ".bps" -type "matrix" -0.94109188299031676 -0.095762768767485212 0.32430781656896018 0
		 0.051023445601845248 -0.98829559381339105 -0.14376518093040758 0 0.33427933793259923 -0.1187489425932815 0.93496310775576719 0
		 -2.5391937484499918 17.699380587189381 7.5313220175681721 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_R_fingerB1_JNT" -p "ANM_R_hand_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".t" -type "double3" 0.20233400626084619 0.86377521210038544 0.092718557425021358 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 1.255032289550407e-005 -6.1263142108714417e-006 -90.856331937934627 ;
	setAttr ".bps" -type "matrix" -0.86438413684336468 0.30019960739779322 -0.40338599342535864 0
		 -0.027649996169190751 -0.82939128943530571 -0.55798348248015839 0 -0.50207125160219646 -0.47115844970354975 0.72521319181848354 0
		 -4.1970204883127504 17.032568567877941 7.4214108371452197 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_R_fingerB2_JNT" -p "ANM_R_fingerB1_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" -0.8804593754110337 0.054152174004001435 -0.012800962096376343 ;
	setAttr ".jo" -type "double3" 1.2547858734911258e-005 3.4827304193105462e-021 5.4743103174469634e-028 ;
	setAttr ".bps" -type "matrix" -0.94022430087345521 -0.1679635850131837 0.2962541107842086 0
		 -0.02765010612352169 -0.82939139261966899 -0.55798332365740511 0 0.3394314889316859 -0.5328209379875436 0.77516973132578837 0
		 -3.43103568341476 16.729372949082983 7.7370763717511855 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_R_fingerB3_JNT" -p "ANM_R_fingerB2_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" -0.94612845272188306 -0.0036607922686495852 -0.14081045193533206 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 5.0417900415766546e-005 2.5003819170225604e-005 90.856331937934755 ;
	setAttr ".bps" -type "matrix" -0.013595273807730826 -0.8267882695465758 -0.56234893604440284 0
		 0.94053282703250563 0.18033982305525043 -0.28788113778892199 0 0.33943065536915817 -0.53282145748888565 0.7751697392410809 0
		 -2.5891570004806725 16.966351062561547 7.3496725891451309 1;
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
	setAttr ".lr" -type "double3" -0.026375344444549857 0.10779448152412655 -2.4810880419286915e-005 ;
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
	setAttr ".tg[0].tot" -type "double3" -2.9582283945787951e-031 3.5527136788005009e-015 
		-5.5511151231257827e-016 ;
	setAttr ".tg[0].tor" -type "double3" 89.999999999999972 1.1344551889577337 90.000000000000014 ;
	setAttr ".lr" -type "double3" 4.0928883287266188e-015 1.4381749626106463e-014 3.1805546814635176e-015 ;
	setAttr ".rst" -type "double3" 3.5590723676166061 1.1383323917533787 -1.5900400000000019e-016 ;
	setAttr ".rsrr" -type "double3" 4.0928883287266196e-015 1.4381749626106463e-014 
		3.1805546814635176e-015 ;
	setAttr -k on ".w0";
createNode joint -n "ANM_L_thigh_JNT" -p "ANM_pelvis_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" -0.71371618524250735 -0.17289943243137618 -2.8484895926668266 ;
	setAttr ".r" -type "double3" -0.052920909687303799 0.0097278859651236654 0.00076715636282048976 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -151.6386049948907 ;
	setAttr ".bps" -type "matrix" 0.00040295008765742278 -0.28577577958426947 0.95829642670430015 0
		 0.00046166900646193976 0.95829645554091791 0.28577559405841907 0 -0.99999981224646028 0.00032726245853651869 0.00051807946099351968 0
		 2.848489592666827 11.498213947345427 0.42027724464006355 1;
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
	setAttr ".bps" -type "matrix" -0.00048449721645422295 -0.93989529293122676 -0.34146244828409905 0
		 -0.00037519260642892888 0.34146263518137215 -0.93989527502030856 0 0.99999981224646028 -0.00032726245853661074 -0.00051807946099360045 0
		 2.8505797801114587 9.973261728383882 5.4180562717282115 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_L_ankle_JNT" -p "ANM_L_kne_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" 4.4629705516466309 -0.19219293746863969 -1.3322676295501878e-015 ;
	setAttr ".r" -type "double3" 0.044909848096958208 -0.029637141297325979 -0.16345051460969465 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 180 7.293985666707293e-015 -47.832575729296927 ;
	setAttr ".bps" -type "matrix" -1.9102684530570798e-012 -0.84311408690147405 0.53773472685729862 0
		 1.2368538268234253e-012 0.53773472685729862 0.84311408690147449 0 -1.0000000000000004 2.2757828065621266e-012 1.5544423387359174e-014 0
		 2.8484895926712137 5.7129100075092429 4.0747606543621648 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_L_ball_JNT" -p "ANM_L_ankle_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" 3.3008935566004065 1.4975401011280085 1.4863374141294276e-015 ;
	setAttr ".r" -type "double3" -1.8629086129226902e-016 -4.9666570217267276e-013 0.039204104519091829 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -2.3606876156458488e-015 -4.3203499057149944e-015 
		57.305373853835981 ;
	setAttr ".bps" -type "matrix" 1.0594828087470636e-014 -0.0021955409440944651 0.9999975897970772 0
		 2.2757022435482717e-012 0.99999758979707676 0.0021955409440946871 0 -1.0000000000000004 2.2757828065621266e-012 1.5544423387359174e-014 0
		 2.8484895926667591 3.7351594678150528 7.1123629043665844 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_L_toe_JNT" -p "ANM_L_ball_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" 1.6846309758415936 1.4578127656212214e-005 8.8817841970012523e-016 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -179.99999999999997 5.9118609695590769e-015 162.24655499007392 ;
	setAttr ".bps" -type "matrix" 6.8382040938413689e-013 0.30701181175736458 -0.95170570421820055 0
		 2.1711246847359651e-012 0.95170570421820011 0.30701181175736492 0 1.0000000000000004 -2.2763219991307629e-012 -1.5718362123514047e-014 0
		 2.8484895926667759 3.7314753696244227 8.7969898519125529 1;
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
	setAttr ".r" -type "double3" -0.053203400898068416 0.009779323199628584 0.00049483381558641576 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -151.63860499540664 ;
	setAttr ".bps" -type "matrix" 0.00040413018351875948 -0.28577889395439604 0.9582954974583765 0
		 0.00046303108685039805 0.95829552646146421 0.28577870733516636 0 -0.99999981114048608 0.00032822880427098972 0.00051960065884063943 0
		 -2.8480000000000012 11.498213947345429 0.42027724464006333 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_R_kne_JNT" -p "ANM_R_thigh_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 5.2251490345575728 -0.033112071266125032 0 ;
	setAttr ".r" -type "double3" 1.4452594001872438e-019 2.3746429862182261e-019 0.00067483744247915397 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 180 0 -24.661834884872437 ;
	setAttr ".bps" -type "matrix" -0.00048592449912242931 -0.93989566755007004 -0.34146141509399014 0
		 -0.00037629293611962438 0.34146160309244267 -0.93989564953624805 0 0.99999981114048608 -0.00032822880427108177 -0.00051960065884072021 0
		 -2.8459036914800988 9.9732454857364843 5.4180513130819445 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_R_ankle_JNT" -p "ANM_R_kne_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" 4.4629705516736404 -0.19219293723639569 -8.8817841970012523e-016 ;
	setAttr ".r" -type "double3" 0.045063636508279999 -0.029923204301472887 -1.1767172476730378e-005 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 180 0 -47.832575729296927 ;
	setAttr ".bps" -type "matrix" 1.4398822510796851e-008 -0.84157268223274695 0.54014388871816343 0
		 1.1293872554936184e-008 0.54014388871816399 0.84157268223274739 0 -1 -6.0173393315625032e-009 1.7282050555596576e-008 0
		 -2.8480000373653658 5.7128922913630991 4.074760378564739 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_R_ball_JNT" -p "ANM_R_ankle_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" 3.3112769501039478 1.490875810459942 2.0689465252132777e-008 ;
	setAttr ".r" -type "double3" -2.8261965287771661e-006 -2.4456584690883553e-011 -6.0529502578800471e-014 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 57.305373853835981 ;
	setAttr ".bps" -type "matrix" 1.7282175747406565e-008 -2.0797953748652453e-005 0.999999999783723 0
		 4.330945472729277e-008 0.99999999978372189 2.0797953748577149e-005 0 -0.99999999999999911 4.330909539336553e-008 1.7283076444504823e-008 0
		 -2.8479999935385805 3.7314995247063267 7.1180067417014001 1;
	setAttr ".radi" 0.5;
createNode joint -n "ANM_R_toe_JNT" -p "ANM_R_ball_JNT";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" yes;
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" 1.6846309758415954 1.4578009601075887e-005 3.6080608722954828e-008 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -179.99999999999997 7.0622500768802573e-031 162.24655499007392 ;
	setAttr ".bps" -type "matrix" -3.2531681435473949e-009 0.30494137039282992 -0.95237112546682334 0
		 4.6516657415143922e-008 0.95237112546682223 0.30494137039283015 0 0.99999999999999911 -4.3309095932935093e-008 -1.7283076617270543e-008 0
		 -2.8480000005044692 3.7314790658388071 8.8026377174818418 1;
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
	setAttr ".lr" -type "double3" -3.1805546814635168e-015 3.1805546814635168e-015 -3.1805546814635168e-015 ;
	setAttr ".rst" -type "double3" -0.75881200000000959 -0.9978550000000026 1.5900399999999999e-016 ;
	setAttr ".rsrr" -type "double3" 6.3611093629270335e-015 -3.1805546814635176e-015 
		9.5416640443905503e-015 ;
	setAttr -k on ".w0";
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
	setAttr -s 11 ".lnk";
	setAttr -s 11 ".slnk";
createNode displayLayerManager -n "layerManager";
	setAttr ".cdl" 4;
	setAttr -s 6 ".dli[1:5]"  1 5 2 3 4;
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
		+ "                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 0\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n"
		+ "                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n"
		+ "            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 1\n            -activeComponentsXray 0\n            -displayTextures 1\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n"
		+ "            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 0\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n"
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
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-defaultImage \"\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 1\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 0\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 1\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 0\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 24 -ast 1 -aet 25 ";
	setAttr ".st" 6;
createNode makeNurbCircle -n "makeNurbCircle1";
	setAttr ".nr" -type "double3" 0 1 0 ;
	setAttr ".r" 1.2768516355161423;
createNode makeNurbCircle -n "makeNurbCircle2";
	setAttr ".nr" -type "double3" 0 1 0 ;
	setAttr ".r" 1.2768516355161423;
createNode ikRPsolver -n "ikRPsolver1";
createNode transformGeometry -n "transformGeometry1";
	setAttr ".txf" -type "matrix" 1.9213613116737076 0 0 0 0 1.1007416359426678 0 0
		 0 0 3.0927776321465079 0 0 -4.4408920985006262e-016 0 1;
createNode transformGeometry -n "transformGeometry2";
	setAttr ".txf" -type "matrix" 1.9213613116737076 0 0 0 0 1.1007416359426678 0 0
		 0 0 3.0927776321465079 0 0 -4.4408920985006262e-016 0 1;
createNode makeNurbCircle -n "makeNurbCircle3";
	setAttr ".nr" -type "double3" 0 1 0 ;
	setAttr ".r" 2.742900695244606;
createNode transformGeometry -n "transformGeometry3";
	setAttr ".txf" -type "matrix" 2.2204460492503131e-016 1 0 0 -1 2.2204460492503131e-016 0 0
		 0 0 1 0 0 0 0 1;
createNode transformGeometry -n "transformGeometry4";
	setAttr ".txf" -type "matrix" 2.2204460492503131e-016 1 0 0 -1 2.2204460492503131e-016 0 0
		 0 0 1 0 0 0 0 1;
createNode makeNurbCircle -n "makeNurbCircle4";
	setAttr ".nr" -type "double3" 0 1 0 ;
	setAttr ".r" 2.742900695244606;
createNode makeNurbCircle -n "makeNurbCircle5";
	setAttr ".nr" -type "double3" 0 1 0 ;
	setAttr ".r" 3.3466469977280382;
createNode transformGeometry -n "transformGeometry5";
	setAttr ".txf" -type "matrix" 3.3512036965969867 0 -3.3512036965969871 0 0 4.7393177180023098 0 0
		 3.3512036965969871 0 3.3512036965969867 0 1.4248023943560072e-016 0 0 1;
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
createNode makeNurbCircle -n "makeNurbCircle7";
	setAttr ".nr" -type "double3" 0 1 0 ;
	setAttr ".r" 4.1231056256176606;
createNode transformGeometry -n "transformGeometry6";
	setAttr ".txf" -type "matrix" 2.2204460492503131e-016 1 0 0 -1 2.2204460492503131e-016 0 0
		 0 0 1 0 0 0 0 1;
createNode makeNurbCircle -n "makeNurbCircle8";
	setAttr ".nr" -type "double3" 0 1 0 ;
	setAttr ".r" 1.576222017578607;
createNode transformGeometry -n "transformGeometry7";
	setAttr ".txf" -type "matrix" 1 0 0 0 0 2.2204460492503131e-016 1 0 0 -1 2.2204460492503131e-016 0
		 0 0 0 1;
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
createNode animCurveUU -n "R_wrist_IK_ikBlend";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 1 1;
createNode makeNurbCircle -n "makeNurbCircle9";
	setAttr ".nr" -type "double3" 0 1 0 ;
	setAttr ".r" 2.0678480746550334;
createNode transformGeometry -n "transformGeometry8";
	setAttr ".txf" -type "matrix" 2.5601016119540509 0 0 0 0 2.5601016119540509 0 0
		 0 0 2.5601016119540509 0 0 0 0 1;
createNode transformGeometry -n "transformGeometry9";
	setAttr ".txf" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -3.0566424650183748e-017 3.7359913749200895 0.07186931591239043 1;
createNode transformGeometry -n "transformGeometry10";
	setAttr ".txf" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 3.0566424650183748e-017 -3.7359913749200895 -0.07186931591239043 1;
createNode transformGeometry -n "transformGeometry11";
	setAttr ".txf" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 4.3940544309050047 4.05695682145166 -0.20782508853544568 1;
createNode transformGeometry -n "transformGeometry12";
	setAttr ".txf" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 8 4.0344808430410737 -3.058967829608279 1;
createNode transformGeometry -n "transformGeometry13";
	setAttr ".txf" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -11.782000000000007 3.7641808430410784 -0.21952982960827999 1;
createNode transformGeometry -n "transformGeometry14";
	setAttr ".txf" -type "matrix" 0.99999161187777263 0.0025754159433709089 -0.0031848715535587489 0
		 -0.0025749573719610441 0.99999667382843005 0.00014807636157642413 0 0.0031852423183519737 -0.00013987421100821913 0.99999491732037227 0
		 11.80010151247942 3.7641808430410784 -0.21952982960827999 1;
createNode makeNurbCircle -n "makeNurbCircle11";
	setAttr ".nr" -type "double3" 0 1 0 ;
	setAttr ".r" 3.1616561568484061;
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
createNode makeNurbCircle -n "makeNurbCircle12";
	setAttr ".nr" -type "double3" 0 1 0 ;
	setAttr ".r" 1.7553208284606912;
createNode transformGeometry -n "transformGeometry15";
	setAttr ".txf" -type "matrix" 1.7190706831620506 0 0 0 0 1.7190706831620506 0 0
		 0 0 1.3671198329746217 0 0 0 0 1;
createNode transformGeometry -n "transformGeometry16";
	setAttr ".txf" -type "matrix" 0.83776344817125969 0 0 0 0 0.83776344817125969 0 0
		 0 0 0.83776344817125969 0 0 0 0 1;
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
createNode transformGeometry -n "transformGeometry17";
	setAttr ".txf" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 2.9771740628348198e-012 2.5469404363320791e-011 1.2527578974186326e-009 1;
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
createNode animCurveTL -n "Spine_CTL_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 12 0 25 0;
createNode animCurveTL -n "Spine_CTL_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 3.5527136788005009e-015 12 3.5527136788005009e-015
		 25 3.5527136788005009e-015;
createNode animCurveTL -n "Spine_CTL_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 -0.6745393067868366 12 -0.6745393067868366
		 25 -0.6745393067868366;
createNode animCurveTA -n "Spine_CTL_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 2.8338829952841134 6 2.7742078255211662
		 12 2.8338829952841134 18 2.7086357052491108 25 2.8338829952841134;
createNode animCurveTA -n "Spine_CTL_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 0 6 0.57872752503445879 12 0 18 -0.83348848803007547
		 25 0;
createNode animCurveTA -n "Spine_CTL_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 0 6 -11.774333868157202 12 0 18 17.091360844032518
		 25 0;
createNode animCurveTA -n "breast_CTL_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 12 0 25 0;
createNode animCurveTA -n "breast_CTL_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 12 0 25 0;
createNode animCurveTA -n "breast_CTL_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 0 6 -9.2032020877204026 12 0 18 2.0033823096744681
		 25 0;
createNode animCurveTA -n "neck_CTL_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 6 0.21915166796271213 12 0;
createNode animCurveTA -n "neck_CTL_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 0 6 -10 12 0 18 10 25 0;
createNode animCurveTA -n "neck_CTL_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  1 0 6 11.430721059283142 12 0 18 -9.5233145581713483
		 25 0;
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
	setAttr -s 5 ".ktv[0:4]"  1 0 6 3.6360264925005654 12 0 18 -3.6123697375999746
		 25 0;
select -ne :time1;
	setAttr ".o" 24;
	setAttr ".unw" 24;
select -ne :renderPartition;
	setAttr -s 11 ".st";
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultShaderList1;
	setAttr -s 9 ".s";
select -ne :defaultTextureList1;
	setAttr -s 3 ".tx";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -s 3 ".u";
select -ne :defaultRenderingList1;
select -ne :renderGlobalsList1;
select -ne :defaultRenderGlobals;
	setAttr ".mcfr" 12;
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
	setAttr ".hwfr" 12;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 18 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surfaces" "Particles" "Fluids" "Image Planes" "UI:" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 18 0 1 1 1 1 1
		 1 0 0 0 0 0 0 0 0 0 0 0 ;
select -ne :defaultHardwareRenderGlobals;
	setAttr ".fn" -type "string" "im";
	setAttr ".res" -type "string" "ntsc_4d 646 485 1.333";
select -ne :ikSystem;
	setAttr -s 2 ".sol";
connectAttr "cons.di" "Controllers.do";
connectAttr "makeNurbCircle6.oc" "Global_CTLShape.cr";
connectAttr "transformGeometry2.og" "L_foot_CTLShape.cr";
connectAttr "L_invHeel_JNT_rotateZ.o" "L_invHeel_JNT.rz";
connectAttr "L_invHeel_JNT.s" "L_invToe_JNT.is";
connectAttr "L_invToe_JNT_rotateZ.o" "L_invToe_JNT.rz";
connectAttr "L_invToe_JNT.s" "L_invBall_JNT.is";
connectAttr "L_invBall_JNT_rotateZ.o" "L_invBall_JNT.rz";
connectAttr "L_invBall_JNT.s" "L_invAnkle_JNT.is";
connectAttr "ANM_L_thigh_JNT.msg" "L_ankle_IK.hsj";
connectAttr "|ANM_pelvis_JNT|ANM_L_thigh_JNT|ANM_L_kne_JNT|ANM_L_effector1.hp" "L_ankle_IK.hee"
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
connectAttr "transformGeometry1.og" "R_foot_CTLShape.cr";
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
connectAttr "transformGeometry5.og" "pelvis_CTLShape.cr";
connectAttr "Spine_CTL_translateX.o" "Spine_CTL.tx";
connectAttr "Spine_CTL_translateY.o" "Spine_CTL.ty";
connectAttr "Spine_CTL_translateZ.o" "Spine_CTL.tz";
connectAttr "Spine_CTL_rotateX.o" "Spine_CTL.rx";
connectAttr "Spine_CTL_rotateY.o" "Spine_CTL.ry";
connectAttr "Spine_CTL_rotateZ.o" "Spine_CTL.rz";
connectAttr "transformGeometry10.og" "Spine_CTLShape.cr";
connectAttr "breast_CTL_rotateX.o" "breast_CTL.rx";
connectAttr "breast_CTL_rotateY.o" "breast_CTL.ry";
connectAttr "breast_CTL_rotateZ.o" "breast_CTL.rz";
connectAttr "makeNurbCircle11.oc" "breast_CTLShape.cr";
connectAttr "transformGeometry13.og" "R_wrist_CTLShape.cr";
connectAttr "ANM_R_shoulder_JNT.msg" "R_wrist_IK.hsj";
connectAttr "ANM_L_effector2.hp" "R_wrist_IK.hee";
connectAttr "ikRPsolver.msg" "R_wrist_IK.hsv";
connectAttr "R_wrist_IK_ikBlend.o" "R_wrist_IK.ikb";
connectAttr "transformGeometry11.og" "L_shoulder_CTLShape.cr";
connectAttr "transformGeometry14.og" "L_wrist_CTLShape.cr";
connectAttr "ANM_L_shoulder_JNT.msg" "L_wrist_IK.hsj";
connectAttr "|ANM_pelvis_JNT|ANM_spine1_JNT|ANM_spine2_JNT|ANM_L_clavicle_JNT|ANM_L_shoulder_JNT|ANM_L_elbow_JNT|ANM_L_effector1.hp" "L_wrist_IK.hee"
		;
connectAttr "ikRPsolver.msg" "L_wrist_IK.hsv";
connectAttr "L_wrist_IK_ikBlend.o" "L_wrist_IK.ikb";
connectAttr "transformGeometry17.og" "L_IKFK_BlendShape.cr";
connectAttr "neck_CTL_rotateX.o" "neck_CTL.rx";
connectAttr "neck_CTL_rotateY.o" "neck_CTL.ry";
connectAttr "neck_CTL_rotateZ.o" "neck_CTL.rz";
connectAttr "transformGeometry16.og" "neck_CTLShape.cr";
connectAttr "head_CTL_rotateX.o" "head_CTL.rx";
connectAttr "head_CTL_rotateY.o" "head_CTL.ry";
connectAttr "head_CTL_rotateZ.o" "head_CTL.rz";
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
connectAttr "ANM_L_wrist_JNT.tx" "|ANM_pelvis_JNT|ANM_spine1_JNT|ANM_spine2_JNT|ANM_L_clavicle_JNT|ANM_L_shoulder_JNT|ANM_L_elbow_JNT|ANM_L_effector1.tx"
		;
connectAttr "ANM_L_wrist_JNT.ty" "|ANM_pelvis_JNT|ANM_spine1_JNT|ANM_spine2_JNT|ANM_L_clavicle_JNT|ANM_L_shoulder_JNT|ANM_L_elbow_JNT|ANM_L_effector1.ty"
		;
connectAttr "ANM_L_wrist_JNT.tz" "|ANM_pelvis_JNT|ANM_spine1_JNT|ANM_spine2_JNT|ANM_L_clavicle_JNT|ANM_L_shoulder_JNT|ANM_L_elbow_JNT|ANM_L_effector1.tz"
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
connectAttr "ANM_L_ankle_JNT.tx" "|ANM_pelvis_JNT|ANM_L_thigh_JNT|ANM_L_kne_JNT|ANM_L_effector1.tx"
		;
connectAttr "ANM_L_ankle_JNT.ty" "|ANM_pelvis_JNT|ANM_L_thigh_JNT|ANM_L_kne_JNT|ANM_L_effector1.ty"
		;
connectAttr "ANM_L_ankle_JNT.tz" "|ANM_pelvis_JNT|ANM_L_thigh_JNT|ANM_L_kne_JNT|ANM_L_effector1.tz"
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
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "makeNurbCircle2.oc" "transformGeometry1.ig";
connectAttr "makeNurbCircle1.oc" "transformGeometry2.ig";
connectAttr "makeNurbCircle3.oc" "transformGeometry3.ig";
connectAttr "makeNurbCircle4.oc" "transformGeometry4.ig";
connectAttr "makeNurbCircle5.oc" "transformGeometry5.ig";
connectAttr "R_foot_CTL.footRoll" "R_invToe_JNT_rotateZ.i";
connectAttr "R_foot_CTL.footRoll" "R_invBall_JNT_rotateZ.i";
connectAttr "R_foot_CTL.footRoll" "R_invHeel_JNT_rotateZ.i";
connectAttr "L_foot_CTL.footRoll" "L_invHeel_JNT_rotateZ.i";
connectAttr "L_foot_CTL.footRoll" "L_invToe_JNT_rotateZ.i";
connectAttr "L_foot_CTL.footRoll" "L_invBall_JNT_rotateZ.i";
connectAttr "makeNurbCircle7.oc" "transformGeometry6.ig";
connectAttr "makeNurbCircle8.oc" "transformGeometry7.ig";
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
connectAttr "R_IKFK_Blend.IK_FK_Blend" "R_wrist_IK_ikBlend.i";
connectAttr "makeNurbCircle9.oc" "transformGeometry8.ig";
connectAttr "transformGeometry8.og" "transformGeometry9.ig";
connectAttr "transformGeometry9.og" "transformGeometry10.ig";
connectAttr "transformGeometry6.og" "transformGeometry11.ig";
connectAttr "transformGeometry7.og" "transformGeometry12.ig";
connectAttr "transformGeometry3.og" "transformGeometry13.ig";
connectAttr "transformGeometry4.og" "transformGeometry14.ig";
connectAttr "R_wrist_CTL.ThumbCurl" "ANM_R_thumb1_JNT_rotateY.i";
connectAttr "R_wrist_CTL.ThumbCurl" "ANM_R_thumb2_JNT_rotateZ.i";
connectAttr "R_wrist_CTL.Finger_A_Curl" "ANM_R_fingerA1_JNT_rotateY.i";
connectAttr "R_wrist_CTL.Finger_A_Curl" "ANM_R_fingerA2_JNT_rotateY.i";
connectAttr "R_wrist_CTL.Finger_B_Curl" "ANM_R_fingerB1_JNT_rotateY.i";
connectAttr "R_wrist_CTL.Finger_B_Curl" "ANM_R_fingerB2_JNT_rotateY.i";
connectAttr "makeNurbCircle12.oc" "transformGeometry15.ig";
connectAttr "transformGeometry15.og" "transformGeometry16.ig";
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
connectAttr "transformGeometry12.og" "transformGeometry17.ig";
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
connectAttr "baldr1:wire_224198087.pa" ":renderPartition.st" -na;
connectAttr "baldr1:default1.pa" ":renderPartition.st" -na;
connectAttr "lambert2SG.pa" ":renderPartition.st" -na;
connectAttr "lambert3SG.pa" ":renderPartition.st" -na;
connectAttr "balder:default1.pa" ":renderPartition.st" -na;
connectAttr "Objekt003SG.pa" ":renderPartition.st" -na;
connectAttr "Objekt003SG1.pa" ":renderPartition.st" -na;
connectAttr "Objekt003SG2.pa" ":renderPartition.st" -na;
connectAttr "Objekt003SG3.pa" ":renderPartition.st" -na;
connectAttr "baldr1:wire_224198088.msg" ":defaultShaderList1.s" -na;
connectAttr "baldr1:default2.msg" ":defaultShaderList1.s" -na;
connectAttr "lambert2.msg" ":defaultShaderList1.s" -na;
connectAttr "lambert3.msg" ":defaultShaderList1.s" -na;
connectAttr "balder:default2.msg" ":defaultShaderList1.s" -na;
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "FBXASC0482FBXASC032FBXASC045FBXASC032Default1.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "file1.msg" ":defaultTextureList1.tx" -na;
connectAttr "file2.msg" ":defaultTextureList1.tx" -na;
connectAttr "MapFBXASC032FBXASC0353.msg" ":defaultTextureList1.tx" -na;
connectAttr "place2dTexture1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "ikRPsolver.msg" ":ikSystem.sol" -na;
connectAttr "ikRPsolver1.msg" ":ikSystem.sol" -na;
// End of Rigg.ma
