package glslang_tests;

import "core:fmt"
import "core:c"

import glslang "../";

SpirVBinary :: struct {
    words : []u32, // SPIR-V words
};

compileShaderToSPIRV_Vulkan :: proc(stage : glslang.Stage, shaderSource : cstring, fileName : cstring) -> SpirVBinary {
    
	input : glslang.input_t = {
        language = .SOURCE_GLSL,
        stage = stage,
        client = .CLIENT_VULKAN,
        client_version = .TARGET_VULKAN_1_2,
        target_language = .TARGET_SPV,
        target_language_version = .TARGET_SPV_1_5,
        code = shaderSource,
        default_version = 100,
        default_profile = .NO_PROFILE,
        force_default_version_and_profile = false,
        forward_compatible = false,
        messages = .MSG_DEFAULT_BIT,
        resource = glslang.default_resource(),
    };

    shader : glslang.Shader = glslang.shader_create(&input);

    bin : SpirVBinary = {
        words = nil,
    };

    if (!glslang.shader_preprocess(shader, &input))	{
        fmt.printf("GLSL preprocessing failed %s\n", fileName);
        fmt.printf("%s\n", glslang.shader_get_info_log(shader));
        fmt.printf("%s\n", glslang.shader_get_info_debug_log(shader));
        fmt.printf("%s\n", input.code);
        glslang.shader_delete(shader);
        return bin;
    }

    if (!glslang.shader_parse(shader, &input)) {
        fmt.printf("GLSL parsing failed %s\n", fileName);
        fmt.printf("%s\n", glslang.shader_get_info_log(shader));
        fmt.printf("%s\n", glslang.shader_get_info_debug_log(shader));
        fmt.printf("%s\n", glslang.shader_get_preprocessed_code(shader));
        glslang.shader_delete(shader);
        return bin;
    }

    program : glslang.Program = glslang.program_create();
    glslang.program_add_shader(program, shader);

    if (!glslang.program_link(program, .MSG_SPV_RULES_BIT | .MSG_VULKAN_RULES_BIT)) {
        fmt.printf("GLSL linking failed %s\n", fileName);
        fmt.printf("%s\n", glslang.program_get_info_log(program));
        fmt.printf("%s\n", glslang.program_get_info_debug_log(program));
        glslang.program_delete(program);
        glslang.shader_delete(shader);
        return bin;
    }

    glslang.program_SPIRV_generate(program, stage);

    bin.words = make([]u32, glslang.program_SPIRV_get_size(program));
    glslang.program_SPIRV_get(program, &bin.words[0]);
	
    spirv_messages : cstring = glslang.program_SPIRV_get_messages(program);
    if (spirv_messages != nil) {
    	fmt.printf("(%s) %s\b", fileName, spirv_messages);
	}

    glslang.program_delete(program);
    glslang.shader_delete(shader);

    return bin;
}