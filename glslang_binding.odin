package glslang;

when ODIN_OS == .Windows {
	when ODIN_DEBUG {
		@(extra_linker_flags = "/NODEFAULTLIB:libcmt") //In case of 4099 warnings, then use /ignore:4099
		foreign import glslang {
			"glslang/Debug/lib/GenericCodeGend.lib",
			"glslang/Debug/lib/glslang-default-resource-limitsd.lib",
			"glslang/Debug/lib/glslangd.lib",
			//"glslang/Debug/lib/HLSLd.lib",
			"glslang/Debug/lib/MachineIndependentd.lib",
			//"glslang/Debug/lib/OGLCompilerd.lib",
			"glslang/Debug/lib/SPIRV-Tools-optd.lib",
			"glslang/Debug/lib/SPIRV-Toolsd.lib",
			"glslang/Debug/lib/SPIRVd.lib",
			//"glslang/Debug/lib/SPVRemapperd.lib",
		}
	}
	else {
		@(extra_linker_flags = "/NODEFAULTLIB:libcmt")
		foreign import glslang {
			"glslang/Release/lib/GenericCodeGen.lib",
			"glslang/Release/lib/glslang-default-resource-limits.lib",
			"glslang/Release/lib/glslang.lib",
			//"glslang/Release/lib/HLSL.lib",
			"glslang/Release/lib/MachineIndependent.lib",
			//"glslang/Release/lib/OGLCompiler.lib",
			"glslang/Release/lib/SPIRV-Tools-opt.lib",
			"glslang/Release/lib/SPIRV-Tools.lib",
			"glslang/Release/lib/SPIRV.lib",
			//"glslang/Releasev/SPVRemapper.lib",
		}
	}
}

@(default_calling_convention="c")
@(link_prefix = "glslang_")
foreign glslang {

	glslang_initialize_process :: proc() -> glsl_int ---;
	glslang_finalize_process :: proc() ---;

	shader_create 						:: proc(input : Input) -> Shader ---;
	shader_delete 						:: proc(shader : Shader) ---;
	shader_set_preamble 				:: proc(shader : Shader, s : cstring) ---;
	shader_shift_binding 				:: proc(shader : Shader, res : Resource_type, base : glsl_uint) ---;
	shader_shift_binding_for_set 		:: proc(shader : Shader, res : Resource_type, base : glsl_uint, set : glsl_uint) ---;
	shader_set_options 					:: proc(shader : Shader, options : glsl_int) ---;
	shader_set_glsl_version 			:: proc(shader : Shader, version : glsl_int) ---;
	shader_preprocess 					:: proc(shader : Shader, input : Input) -> glsl_int ---;
	shader_parse 						:: proc(shader : Shader, input : Input) -> glsl_int ---;
	shader_get_preprocessed_code 		:: proc(shader : Shader) -> cstring ---;
	shader_get_info_log 				:: proc(shader : Shader) -> cstring ---;
	shader_get_info_debug_log 			:: proc(shader : Shader) -> cstring ---;

	program_create 						:: proc() -> Program ---;
	program_delete 						:: proc(program : Program) ---;
	program_add_shader					:: proc(program : Program, shader : Shader) ---;
	program_link						:: proc(program : Program, messages : messages_t) -> glsl_int ---;
	program_add_source_text				:: proc(program : Program, stage : Stage, text : cstring, len : size_t) ---;
	program_set_source_file				:: proc(program : Program, stage : Stage, file : cstring) ---;
	program_map_io						:: proc(program : Program) -> glsl_int ---;
	program_SPIRV_generate				:: proc(program : Program, stage : Stage) ---;
	program_SPIRV_generate_with_options	:: proc(program : Program, stage : Stage, spv_options : ^spv_options_t) ---;
	program_SPIRV_get_size				:: proc(program : Program) -> size_t ---;
	program_SPIRV_get					:: proc(program : Program, something_idk : ^glsl_uint) ---;
	program_SPIRV_get_ptr				:: proc(program : Program) -> ^glsl_uint ---;
	program_SPIRV_get_messages			:: proc(program : Program) -> cstring ---;
	program_get_info_log				:: proc(program : Program) -> cstring ---;
	program_get_info_debug_log			:: proc(program : Program) -> cstring ---;

	////////////////////////////////////// resource_limits_c.h //////////////////////////////////////
	// Returns a struct that can be use to create custom resource values.
	resource :: proc() -> Resource ---;
	
	// These are the default resources for TBuiltInResources, used for both
	//  - parsing this string for the case where the user didn't supply one,
	//  - dumping out a template for user construction of a config file.
	default_resource :: proc() -> Resource ---;

	// Returns the DefaultTBuiltInResource as a human-readable string.
	// NOTE: User is responsible for freeing this string.
	default_resource_string :: proc() -> cstring ---;

	// Decodes the resource limits from |config| to |resources|.
	decode_resource_limits :: proc(resources : Resource, config : cstring) ---;
}
