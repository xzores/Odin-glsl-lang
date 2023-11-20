package glslang_tests;

import "core:testing"
import "core:fmt"
import "core:os"
import "core:strings"

@test
compile_some_vulkan_shader :: proc(t : ^testing.T) {
	
	vert_loc := "shader1.vert";
	frag_loc := "shader1.frag";

	vertex_source, vs_ok := os.read_entire_file_from_filename(vert_loc);
	defer delete(vertex_source);

	fragment_source, fs_ok := os.read_entire_file_from_filename(frag_loc);
	defer delete(fragment_source);
	
	assert(vs_ok, "vertex shader loaded incorrectly, possibly missing");
	assert(fs_ok, "fragment shader loaded incorrectly, possibly missing");

	vs_cstring := strings.clone_to_cstring(string(vertex_source[:]));
	defer delete(vs_cstring);

	fs_cstring := strings.clone_to_cstring(string(fragment_source[:]));
	defer delete(fs_cstring);

	vert_bin := compileShaderToSPIRV_Vulkan(.STAGE_VERTEX, vs_cstring, fmt.ctprintf("%s", vert_loc));
	frag_bin := compileShaderToSPIRV_Vulkan(.STAGE_FRAGMENT, fs_cstring, fmt.ctprintf("%s", frag_loc));

}