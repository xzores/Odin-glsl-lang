package glslang;

when ODIN_OS == .Windows do foreign import glslang "glslang/lib/glslang.lib"
when ODIN_OS == .Linux   do foreign import glslang "glslang/lib/glslang.o"
when ODIN_OS == .Darwin  do foreign import glslang "glslang/lib/glslang.dylib"

when ODIN_OS == .Windows do foreign import glslang_spirv "glslang/lib/SPIRV.lib"
when ODIN_OS == .Windows do foreign import glslang_remapper "glslang/lib/SPVRemapper.lib"

/*
when ODIN_OS == .Windows do foreign import glslang_def_res "glslang/lib/glslang-default-resource-limits.lib"
when ODIN_OS == .Linux   do foreign import glslang_def_res "glslang/lib/glslang-default-resource-limits.o"
when ODIN_OS == .Darwin  do foreign import glslang_def_res "glslang/lib/glslang-default-resource-limits.dylib"

when ODIN_OS == .Windows do foreign import glslang_machine_independent "glslang/lib/MachineIndependent.lib"
when ODIN_OS == .Linux   do foreign import glslang_machine_independent "glslang/lib/MachineIndependent.o"
when ODIN_OS == .Darwin  do foreign import glslang_machine_independent "glslang/lib/MachineIndependent.dylib"

when ODIN_OS == .Windows do foreign import glslang_generic_code_gent "glslang/lib/GenericCodeGen.lib"
when ODIN_OS == .Linux   do foreign import glslang_generic_code_gent "glslang/lib/GenericCodeGen.o"
when ODIN_OS == .Darwin  do foreign import glslang_generic_code_gent "glslang/lib/GenericCodeGen.dylib"

when ODIN_OS == .Windows do foreign import glslang_hlsl "glslang/lib/HLSL.lib"
when ODIN_OS == .Linux   do foreign import glslang_hlsl "glslang/lib/HLSL.o"
when ODIN_OS == .Darwin  do foreign import glslang_hlsl "glslang/lib/HLSL.dylib"

when ODIN_OS == .Windows do foreign import glslang_ogl "glslang/lib/OGLCompiler.lib"
when ODIN_OS == .Linux   do foreign import glslang_ogl "glslang/lib/OGLCompiler.o"
when ODIN_OS == .Darwin  do foreign import glslang_ogl "glslang/lib/OGLCompiler.dylib"
*/

@(default_calling_convention="c")
foreign glslang {

	glslang_initialize_process :: proc() -> glsl_int ---;
	glslang_finalize_process :: proc() ---;

	glslang_shader_create 						:: proc(input : Input) -> Shader ---;
	glslang_shader_delete 						:: proc(shader : Shader) ---;
	glslang_shader_set_preamble 				:: proc(shader : Shader, s : cstring) ---;
	glslang_shader_shift_binding 				:: proc(shader : Shader, res : Resource_type, base : glsl_uint) ---;
	glslang_shader_shift_binding_for_set 		:: proc(shader : Shader, res : Resource_type, base : glsl_uint, set : glsl_uint) ---;
	glslang_shader_set_options 					:: proc(shader : Shader, options : glsl_int) ---;
	glslang_shader_set_glsl_version 			:: proc(shader : Shader, version : glsl_int) ---;
	glslang_shader_preprocess 					:: proc(shader : Shader, input : Input) -> glsl_b32 ---;
	glslang_shader_parse 						:: proc(shader : Shader, input : Input) -> glsl_b32 ---;
	glslang_shader_get_preprocessed_code 		:: proc(shader : Shader) -> cstring ---;
	glslang_shader_get_info_log 				:: proc(shader : Shader) -> cstring ---;
	glslang_shader_get_info_debug_log 			:: proc(shader : Shader) -> cstring ---;

	glslang_program_create 						:: proc() -> Program ---;
	glslang_program_delete 						:: proc(program : Program) ---;
	glslang_program_add_shader					:: proc(program : Program, shader : Shader) ---;
	glslang_program_link						:: proc(program : Program, messages : messages_t) -> glsl_b32 ---;
	glslang_program_add_source_text				:: proc(program : Program, stage : Stage, text : cstring, len : size_t) ---;
	glslang_program_set_source_file				:: proc(program : Program, stage : Stage, file : cstring) ---;
	glslang_program_map_io						:: proc(program : Program) -> glsl_b32 ---;
	glslang_program_SPIRV_generate				:: proc(program : Program, stage : Stage) ---;
	glslang_program_SPIRV_generate_with_options	:: proc(program : Program, stage : Stage, spv_options : ^spv_options_t) ---;
	glslang_program_SPIRV_get_size				:: proc(program : Program) -> size_t ---;
	glslang_program_SPIRV_get					:: proc(program : Program, something_idk : ^glsl_uint) ---;
	glslang_program_SPIRV_get_ptr				:: proc(program : Program) -> ^glsl_uint ---;
	glslang_program_SPIRV_get_messages			:: proc(program : Program) -> cstring ---;
	glslang_program_get_info_log				:: proc(program : Program) -> cstring ---;
	glslang_program_get_info_debug_log			:: proc(program : Program) -> cstring ---;

	////////////////////////////////////// resource_limits_c.h //////////////////////////////////////
	// Returns a struct that can be use to create custom resource values.
	glslang_resource :: proc() -> Resource ---;

	// These are the default resources for TBuiltInResources, used for both
	//  - parsing this string for the case where the user didn't supply one,
	//  - dumping out a template for user construction of a config file.
	glslang_default_resource :: proc() -> Resource ---;

	// Returns the DefaultTBuiltInResource as a human-readable string.
	// NOTE: User is responsible for freeing this string.
	glslang_default_resource_string :: proc() -> cstring ---;

	// Decodes the resource limits from |config| to |resources|.
	glslang_decode_resource_limits :: proc(resources : Resource, config : cstring) ---;
}


initialize_process 					:: glslang_initialize_process;
finalize_process 					:: glslang_finalize_process;

shader_create 						:: glslang_shader_create
shader_delete 						:: glslang_shader_delete
shader_set_preamble 				:: glslang_shader_set_preamble
shader_shift_binding 				:: glslang_shader_shift_binding
shader_shift_binding_for_set 		:: glslang_shader_shift_binding_for_set
shader_set_options 					:: glslang_shader_set_options
shader_set_glsl_version 			:: glslang_shader_set_glsl_version
shader_preprocess 					:: glslang_shader_preprocess
shader_parse 						:: glslang_shader_parse
shader_get_preprocessed_code 		:: glslang_shader_get_preprocessed_code
shader_get_info_log 				:: glslang_shader_get_info_log
shader_get_info_debug_log 			:: glslang_shader_get_info_debug_log
program_create 						:: glslang_program_create
program_delete 						:: glslang_program_delete
program_add_shader					:: glslang_program_add_shader
program_link						:: glslang_program_link
program_add_source_text				:: glslang_program_add_source_text
program_set_source_file				:: glslang_program_set_source_file
program_map_io						:: glslang_program_map_io
program_SPIRV_generate				:: glslang_program_SPIRV_generate
program_SPIRV_generate_with_options	:: glslang_program_SPIRV_generate_with_options
program_SPIRV_get_size				:: glslang_program_SPIRV_get_size
program_SPIRV_get					:: glslang_program_SPIRV_get
program_SPIRV_get_ptr				:: glslang_program_SPIRV_get_ptr
program_SPIRV_get_messages			:: glslang_program_SPIRV_get_messages
program_get_info_log				:: glslang_program_get_info_log
program_get_info_debug_log			:: glslang_program_get_info_debug_log

resource 							:: glslang_resource;
default_resource 					:: glslang_default_resource;
default_resource_string 			:: glslang_default_resource_string;
decode_resource_limits 				:: glslang_decode_resource_limits;