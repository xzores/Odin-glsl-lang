package glslang;

import "core:c"

size_t :: i64;
glsl_int :: c.int;
glsl_uint :: c.uint;
glsl_b32 :: b32;

Shader :: distinct rawptr; //^shader_t;
Program :: distinct rawptr //^program_t;
Input :: ^input_t;
Resource :: ^resource_t;

Resource_type :: resource_type_t;
Stage :: stage_t;

/* TLimits counterpart */
limits_t :: struct{
    non_inductive_for_loops 							: bool,
    while_loops 										: bool,
    do_while_loops 										: bool,
    general_uniform_indexing 							: bool,
    general_attribute_matrix_vector_indexing 			: bool,
    general_varying_indexing 							: bool,
    general_sampler_indexing 							: bool,
    general_variable_indexing 							: bool,
    general_constant_matrix_vector_indexing 			: bool,
};

/* TBuiltInResource counterpart */
resource_t :: struct {
    max_lights											: glsl_int,
    max_clip_planes										: glsl_int,
    max_texture_units									: glsl_int,
    max_texture_coords									: glsl_int,
    max_vertex_attribs									: glsl_int,
    max_vertex_uniform_components						: glsl_int,
    max_varying_floats									: glsl_int,
    max_vertex_texture_image_units						: glsl_int,
    max_combined_texture_image_units					: glsl_int,
    max_texture_image_units								: glsl_int,
    max_fragment_uniform_components						: glsl_int,
    max_draw_buffers									: glsl_int,
    max_vertex_uniform_vectors							: glsl_int,
    max_varying_vectors									: glsl_int,
    max_fragment_uniform_vectors						: glsl_int,
    max_vertex_output_vectors							: glsl_int,
    max_fragment_input_vectors							: glsl_int,
    min_program_texel_offset							: glsl_int,
    max_program_texel_offset							: glsl_int,
    max_clip_distances									: glsl_int,
    max_compute_work_group_count_x						: glsl_int,
    max_compute_work_group_count_y						: glsl_int,
    max_compute_work_group_count_z						: glsl_int,
    max_compute_work_group_size_x						: glsl_int,
    max_compute_work_group_size_y						: glsl_int,
    max_compute_work_group_size_z						: glsl_int,
    max_compute_uniform_components						: glsl_int,
    max_compute_texture_image_units						: glsl_int,
    max_compute_image_uniforms							: glsl_int,
    max_compute_atomic_counters 						: glsl_int,
    max_compute_atomic_counter_buffers 					: glsl_int,
    max_varying_components 								: glsl_int,
    max_vertex_output_components 						: glsl_int,
    max_geometry_input_components 						: glsl_int,
    max_geometry_output_components 						: glsl_int,
    max_fragment_input_components 						: glsl_int,
    max_image_units 									: glsl_int,
    max_combined_image_units_and_fragment_outputs 		: glsl_int,
    max_combined_shader_output_resources 				: glsl_int,
    max_image_samples 									: glsl_int,
    max_vertex_image_uniforms 							: glsl_int,
    max_tess_control_image_uniforms 					: glsl_int,
    max_tess_evaluation_image_uniforms 					: glsl_int,
    max_geometry_image_uniforms 						: glsl_int,
    max_fragment_image_uniforms 						: glsl_int,
    max_combined_image_uniforms 						: glsl_int,
    max_geometry_texture_image_units 					: glsl_int,
    max_geometry_output_vertices 						: glsl_int,
    max_geometry_total_output_components 				: glsl_int,
    max_geometry_uniform_components 					: glsl_int,
    max_geometry_varying_components 					: glsl_int,
    max_tess_control_input_components 					: glsl_int,
    max_tess_control_output_components 					: glsl_int,
    max_tess_control_texture_image_units 				: glsl_int,
    max_tess_control_uniform_components 				: glsl_int,
    max_tess_control_total_output_components 			: glsl_int,
    max_tess_evaluation_input_components 				: glsl_int,
    max_tess_evaluation_output_components 				: glsl_int,
    max_tess_evaluation_texture_image_units 			: glsl_int,
    max_tess_evaluation_uniform_components 				: glsl_int,
    max_tess_patch_components 							: glsl_int,
    max_patch_vertices 									: glsl_int,
    max_tess_gen_level 									: glsl_int,
    max_viewports 										: glsl_int,
    max_vertex_atomic_counters 							: glsl_int,
    max_tess_control_atomic_counters 					: glsl_int,
    max_tess_evaluation_atomic_counters 				: glsl_int,
    max_geometry_atomic_counters 						: glsl_int,
    max_fragment_atomic_counters 						: glsl_int,
    max_combined_atomic_counters 						: glsl_int,
    max_atomic_counter_bindings 						: glsl_int,
    max_vertex_atomic_counter_buffers 					: glsl_int,
    max_tess_control_atomic_counter_buffers 			: glsl_int,
    max_tess_evaluation_atomic_counter_buffers 			: glsl_int,
    max_geometry_atomic_counter_buffers 				: glsl_int,
    max_fragment_atomic_counter_buffers 				: glsl_int,
    max_combined_atomic_counter_buffers 				: glsl_int,
    max_atomic_counter_buffer_size 						: glsl_int,
    max_transform_feedback_buffers 						: glsl_int,
    max_transform_feedback_interleaved_components 		: glsl_int,
    max_cull_distances 									: glsl_int,
    max_combined_clip_and_cull_distances 				: glsl_int,
    max_samples 										: glsl_int,
    max_mesh_output_vertices_nv 						: glsl_int,
    max_mesh_output_primitives_nv 						: glsl_int,
    max_mesh_work_group_size_x_nv 						: glsl_int,
    max_mesh_work_group_size_y_nv 						: glsl_int,
    max_mesh_work_group_size_z_nv 						: glsl_int,
    max_task_work_group_size_x_nv 						: glsl_int,
    max_task_work_group_size_y_nv 						: glsl_int,
    max_task_work_group_size_z_nv 						: glsl_int,
    max_mesh_view_count_nv 								: glsl_int,
    max_mesh_output_vertices_ext 						: glsl_int,
    max_mesh_output_primitives_ext 						: glsl_int,
    max_mesh_work_group_size_x_ext 						: glsl_int,
    max_mesh_work_group_size_y_ext 						: glsl_int,
    max_mesh_work_group_size_z_ext 						: glsl_int,
    max_task_work_group_size_x_ext 						: glsl_int,
    max_task_work_group_size_y_ext 						: glsl_int,
    max_task_work_group_size_z_ext 						: glsl_int,
    max_mesh_view_count_ext 							: glsl_int,
    max_dual_source_draw_buffers_ext 					: glsl_int,
    limits 												: limits_t,
};

/* Inclusion result structure allocated by C include_local/include_system callbacks */
include_result_t :: struct{
    
	/* Header file name or NULL if inclusion failed */
    header_name : cstring,
	
    /* Header contents or NULL */
    header_data : cstring,
    header_length : size_t, //size_t.... omg fuck size_t i assume it is 64bits
};

/* Callback for local file inclusion */
include_local_func :: #type proc "c" (ctx : rawptr, header_name : cstring, includer_name : cstring, include_depth : size_t) -> ^include_result_t;

/* Callback for system file inclusion */
include_system_func :: #type proc "c" (ctx : rawptr, header_name : cstring, includer_name : cstring, include_depth : size_t) -> ^include_result_t;

/* Callback for include result destruction */
free_include_result_func :: #type proc "c" (ctx : rawptr, result : ^include_result_t) -> glsl_int;

/* Collection of callbacks for GLSL preprocessor */
include_callbacks_t :: struct {
    include_system : include_system_func,
    include_local : include_local_func,
    free_include_result : free_include_result_func,
};

input_t :: struct {
    language 											: source_t,
    stage 												: stage_t,
    client 												: client_t,
    client_version 										: target_client_version_t,
    target_language 									: target_language_t,
    target_language_version 							: target_language_version_t,

    /** Shader source code */
   	code 												: cstring,
    default_version 									: glsl_int,
    default_profile 									: profile_t,
    force_default_version_and_profile					: glsl_b32,
    forward_compatible									: glsl_b32,
    messages											: messages_t,
    resource 											: Resource,
    callbacks											: include_callbacks_t,
    callbacks_ctx										: rawptr,
};

/* SpvOptions counterpart */
spv_options_t :: struct {
    generate_debug_info									: bool,
    strip_debug_info									: bool,
    disable_optimizer									: bool,
    optimize_size										: bool,
    disassemble											: bool,
    validate											: bool,
    emit_nonsemantic_shader_debug_info					: bool,
    emit_nonsemantic_shader_debug_source				: bool,
    compile_only										: bool,
};

////////////////////////  c_shader_types.h ////////////////////////

/* EShLanguage counterpart */
stage_t :: enum i32 { // would be better as stage, but this is ancient now
    STAGE_VERTEX,
    STAGE_TESSCONTROL,
    STAGE_TESSEVALUATION,
    STAGE_GEOMETRY,
    STAGE_FRAGMENT,
    STAGE_COMPUTE,
    STAGE_RAYGEN,
    STAGE_RAYGEN_NV = STAGE_RAYGEN,
    STAGE_INTERSECT,
    STAGE_INTERSECT_NV = STAGE_INTERSECT,
    STAGE_ANYHIT,
    STAGE_ANYHIT_NV = STAGE_ANYHIT,
    STAGE_CLOSESTHIT,
    STAGE_CLOSESTHIT_NV = STAGE_CLOSESTHIT,
    STAGE_MISS,
    STAGE_MISS_NV = STAGE_MISS,
    STAGE_CALLABLE,
    STAGE_CALLABLE_NV = STAGE_CALLABLE,
    STAGE_TASK,
    STAGE_TASK_NV = STAGE_TASK,
    STAGE_MESH,
    STAGE_MESH_NV = STAGE_MESH,
};

/* EShLanguageMask counterpart */
stage_mask_t :: bit_set[stage_t];

/* EShSource counterpart */
source_t :: enum i32 {
    SOURCE_NONE,
    SOURCE_GLSL,
    SOURCE_HLSL,
};

/* EShClient counterpart */
client_t :: enum i32 {
    CLIENT_NONE,
    CLIENT_VULKAN,
    CLIENT_OPENGL,
};

/* EShTargetLanguage counterpart */
target_language_t :: enum i32 {
    TARGET_NONE,
    TARGET_SPV,
};

/* SH_TARGET_ClientVersion counterpart */
target_client_version_t :: enum i32 {
    TARGET_VULKAN_1_0 = (1 << 22),
    TARGET_VULKAN_1_1 = (1 << 22) | (1 << 12),
    TARGET_VULKAN_1_2 = (1 << 22) | (2 << 12),
    TARGET_VULKAN_1_3 = (1 << 22) | (3 << 12),
    TARGET_OPENGL_450 = 450,
};

/* SH_TARGET_LanguageVersion counterpart */
target_language_version_t :: enum i32 {
    TARGET_SPV_1_0 = (1 << 16),				//0
    TARGET_SPV_1_1 = (1 << 16) | (1 << 8), 	//1
    TARGET_SPV_1_2 = (1 << 16) | (2 << 8), 	//2
    TARGET_SPV_1_3 = (1 << 16) | (3 << 8), 	//3
    TARGET_SPV_1_4 = (1 << 16) | (4 << 8), 	//4
    TARGET_SPV_1_5 = (1 << 16) | (5 << 8), 	//5
    TARGET_SPV_1_6 = (1 << 16) | (6 << 8), 	//6
};

/* EShExecutable counterpart */
executable_t :: enum i32 { 
	EX_VERTEX_FRAGMENT,
	EX_FRAGMENT,
};

// EShOptimizationLevel counterpart
// This enum is not used in the current C interface, but could be added at a later date.
// OPT_NONE is the current default.
optimization_level_t :: enum i32 {
    OPT_NO_GENERATION,
    OPT_NONE,
    OPT_SIMPLE,
    OPT_FULL,
};

/* EShTextureSamplerTransformMode counterpart */
texture_sampler_transform_mode_t :: enum i32 {
    TEX_SAMP_TRANS_KEEP,
    TEX_SAMP_TRANS_UPGRADE_TEXTURE_REMOVE_SAMPLER,
};

/* EShMessages counterpart */
messages_t :: enum i32 {
    MSG_DEFAULT_BIT = 0,
    MSG_RELAXED_ERRORS_BIT = (1 << 0),
    MSG_SUPPRESS_WARNINGS_BIT = (1 << 1),
    MSG_AST_BIT = (1 << 2),
    MSG_SPV_RULES_BIT = (1 << 3),
    MSG_VULKAN_RULES_BIT = (1 << 4),
    MSG_ONLY_PREPROCESSOR_BIT = (1 << 5),
    MSG_READ_HLSL_BIT = (1 << 6),
    MSG_CASCADING_ERRORS_BIT = (1 << 7),
    MSG_KEEP_UNCALLED_BIT = (1 << 8),
    MSG_HLSL_OFFSETS_BIT = (1 << 9),
    MSG_DEBUG_INFO_BIT = (1 << 10),
    MSG_HLSL_ENABLE_16BIT_TYPES_BIT = (1 << 11),
    MSG_HLSL_LEGALIZATION_BIT = (1 << 12),
    MSG_HLSL_DX9_COMPATIBLE_BIT = (1 << 13),
    MSG_BUILTIN_SYMBOL_TABLE_BIT = (1 << 14),
    MSG_ENHANCED = (1 << 15),
};

/* EShReflectionOptions counterpart */
reflection_options_t :: enum i32 {
    REFLECTION_DEFAULT_BIT = 0,
    REFLECTION_STRICT_ARRAY_SUFFIX_BIT = (1 << 0),
    REFLECTION_BASIC_ARRAY_SUFFIX_BIT = (1 << 1),
    REFLECTION_INTERMEDIATE_IOO_BIT = (1 << 2),
    REFLECTION_SEPARATE_BUFFERS_BIT = (1 << 3),
    REFLECTION_ALL_BLOCK_VARIABLES_BIT = (1 << 4),
    REFLECTION_UNWRAP_IO_BLOCKS_BIT = (1 << 5),
    REFLECTION_ALL_IO_VARIABLES_BIT = (1 << 6),
    REFLECTION_SHARED_STD140_SSBO_BIT = (1 << 7),
    REFLECTION_SHARED_STD140_UBO_BIT = (1 << 8),
};

/* EProfile counterpart (from Versions.h) */
profile_t :: enum i32 {
    BAD_PROFILE = 0,
    NO_PROFILE = (1 << 0),
    CORE_PROFILE = (1 << 1),
    COMPATIBILITY_PROFILE = (1 << 2),
    ES_PROFILE = (1 << 3),
};

/* Shader options */
shader_options_t :: enum i32 {
    SHADER_DEFAULT_BIT = 0,
    SHADER_AUTO_MAP_BINDINGS = (1 << 0),
    SHADER_AUTO_MAP_LOCATIONS = (1 << 1),
    SHADER_VULKAN_RULES_RELAXED = (1 << 2),
};

/* TResourceType counterpart */
resource_type_t :: enum i32 {
    RESOURCE_TYPE_SAMPLER,
    RESOURCE_TYPE_TEXTURE,
    RESOURCE_TYPE_IMAGE,
    RESOURCE_TYPE_UBO,
    RESOURCE_TYPE_SSBO,
    RESOURCE_TYPE_UAV,
};