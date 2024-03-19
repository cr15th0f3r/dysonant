package dysonant

USE_GL :: #config(DYSONANT_USE_GL, true)

when ODIN_OS == .Windows
{
    when USE_GL
    {
        foreign import sokol_gfx "sokol_gfx_windows_amd64_gl.lib"
    }
    else
    {
        foreign import sokol_gfx "sokol_gfx_windows_amd64_d3d11.lib"
    }
}

@(default_calling_convention="c")
foreign sokol_gfx
{
    @(link_name="sg_setup", private)
    sg_setup :: proc(desc: ^Sokol_GFX_Desc)  ---

    @(link_name="sg_shutdown", private)
    sg_shutdown :: proc()  ---

    @(link_name="sg_isvalid", private)
    sg_isvalid :: proc() -> bool ---

    @(link_name="sg_reset_state_cache", private)
    sg_reset_state_cache :: proc()  ---

    @(link_name="sg_push_debug_group", private)
    sg_push_debug_group :: proc(name: cstring)  ---

    @(link_name="sg_pop_debug_group", private)
    sg_pop_debug_group :: proc()  ---

    @(link_name="sg_add_commit_listener", private)
    sg_add_commit_listener :: proc(listener: Commit_Listener) -> bool ---

    @(link_name="sg_remove_commit_listener", private)
    sg_remove_commit_listener :: proc(listener: Commit_Listener) -> bool ---

    @(link_name="sg_make_buffer", private)
    sg_make_buffer :: proc(#by_ptr desc: Buffer_Desc) -> Sokol_GFX_Buffer ---

    @(link_name="sg_make_image", private)
    sg_make_image :: proc(#by_ptr desc: Sokol_GFX_Image_Desc) -> Texture ---

    @(link_name="sg_make_sampler", private)
    sg_make_sampler :: proc(#by_ptr desc: Sampler_Desc) -> Sampler ---

    @(link_name="sg_make_shader", private)
    sg_make_shader :: proc(#by_ptr desc: Shader_Desc) -> Shader ---

    @(link_name="sg_make_pipeline", private)
    sg_make_pipeline :: proc(#by_ptr desc: Pipeline_Desc) -> Pipeline ---

    @(link_name="sg_make_attachments", private)
    sg_make_attachments :: proc(#by_ptr desc: Attachments_Desc) -> Attachments ---

    @(link_name="sg_destroy_buffer")
    sg_destroy_buffer :: proc(buf: Sokol_GFX_Buffer)  ---

    @(link_name="sg_destroy_image")
    texture_destroy :: proc(texture: Texture)  ---

    @(link_name="sg_destroy_sampler", private)
    sg_destroy_sampler :: proc(smp: Sampler)  ---

    @(link_name="sg_destroy_shader", private)
    sg_destroy_shader :: proc(shd: Shader)  ---

    @(link_name="sg_destroy_pipeline", private)
    sg_destroy_pipeline :: proc(pip: Pipeline)  ---

    @(link_name="sg_destroy_attachments", private)
    sg_destroy_attachments :: proc(atts: Attachments)  ---

    @(link_name="sg_update_buffer", private)
    sg_update_buffer :: proc(buf: Sokol_GFX_Buffer, #by_ptr data: Range)  ---

    @(link_name="sg_update_image", private)
    sg_update_image :: proc(img: Texture, #by_ptr data: Graphics_Image_Data)  ---

    @(link_name="sg_append_buffer", private)
    sg_append_buffer :: proc(buf: Sokol_GFX_Buffer, #by_ptr data: Range) -> i32 ---

    @(link_name="sg_query_buffer_overflow", private)
    sg_query_buffer_overflow :: proc(buf: Sokol_GFX_Buffer) -> bool ---

    @(link_name="sg_query_buffer_will_overflow", private)
    sg_query_buffer_will_overflow :: proc(buf: Sokol_GFX_Buffer, size: u64) -> bool ---

    @(link_name="sg_begin_pass")
    pass_begin :: proc(pass: ^Pass)  ---

    @(link_name="sg_apply_viewport", private)
    sg_apply_viewport :: proc(#any_int x: i32, #any_int y: i32, #any_int width: i32, #any_int height: i32, origin_top_left: bool)  ---

    @(link_name="sg_apply_viewportf", private)
    sg_apply_viewportf :: proc(x: f32, y: f32, width: f32, height: f32, origin_top_left: bool)  ---

    @(link_name="sg_apply_scissor_rect", private)
    sg_apply_scissor_rect :: proc(#any_int x: i32, #any_int y: i32, #any_int width: i32, #any_int height: i32, origin_top_left: bool)  ---

    @(link_name="sg_apply_scissor_rectf", private)
    sg_apply_scissor_rectf :: proc(x: f32, y: f32, width: f32, height: f32, origin_top_left: bool)  ---

    @(link_name="sg_apply_pipeline", private)
    sg_apply_pipeline :: proc(pip: Pipeline)  ---

    @(link_name="sg_apply_bindings", private)
    sg_apply_bindings :: proc(#by_ptr bindings: Bindings)  ---

    @(link_name="sg_apply_uniforms", private)
    sg_apply_uniforms :: proc(stage: Shader_Stage, #any_int ub_index: i32, #by_ptr data: Range)  ---

    @(link_name="sg_draw", private)
    sg_draw :: proc(#any_int base_element: i32, #any_int num_elements: i32, #any_int num_instances: i32)  ---

    @(link_name="sg_end_pass")
    pass_end :: proc()  ---

    @(link_name="sg_commit")
    graphics_commit :: proc()  ---

    @(link_name="sg_query_desc", private)
    sg_query_desc :: proc() -> Sokol_GFX_Desc ---

    @(link_name="sg_query_backend")
    graphics_get_backend :: proc() -> Graphics_Backend ---

    @(link_name="sg_query_features")
    graphics_get_features :: proc() -> Graphics_Features ---

    @(link_name="sg_query_limits", private)
    sg_query_limits :: proc() -> Limits ---

    @(link_name="sg_query_pixelformat")
    graphics_pixel_format :: proc(fmt: Pixel_Format) -> Pixel_Format_Info ---

    @(link_name="sg_query_row_pitch", private)
    sg_query_row_pitch :: proc(fmt: Pixel_Format, #any_int width: i32, #any_int row_align_bytes: i32) -> i32 ---

    @(link_name="sg_query_surface_pitch", private)
    sg_query_surface_pitch :: proc(fmt: Pixel_Format, #any_int width: i32, #any_int height: i32, #any_int row_align_bytes: i32) -> i32 ---

    @(link_name="sg_query_buffer_state", private)
    sg_query_buffer_state :: proc(buf: Sokol_GFX_Buffer) -> Resource_State ---

    @(link_name="sg_query_image_state", private)
    sg_query_image_state :: proc(img: Texture) -> Resource_State ---

    @(link_name="sg_query_sampler_state", private)
    sg_query_sampler_state :: proc(smp: Sampler) -> Resource_State ---

    @(link_name="sg_query_shader_state", private)
    sg_query_shader_state :: proc(shd: Shader) -> Resource_State ---

    @(link_name="sg_query_pipeline_state", private)
    sg_query_pipeline_state :: proc(pip: Pipeline) -> Resource_State ---

    @(link_name="sg_query_attachments_state", private)
    sg_query_attachments_state :: proc(atts: Attachments) -> Resource_State ---

    @(link_name="sg_query_buffer_info")
    buffer_get_info :: proc(buffer: Sokol_GFX_Buffer) -> Buffer_Info ---

    @(link_name="sg_query_image_info", private)
    sg_query_image_info :: proc(texture: Texture) -> Texture_Info ---

    @(link_name="sg_query_sampler_info", private)
    sg_query_sampler_info :: proc(smp: Sampler) -> Sampler_Info ---

    @(link_name="sg_query_shader_info", private)
    sg_query_shader_info :: proc(shd: Shader) -> Shader_Info ---

    @(link_name="sg_query_pipeline_info", private)
    sg_query_pipeline_info :: proc(pip: Pipeline) -> Pipeline_Info ---

    @(link_name="sg_query_attachments_info", private)
    sg_query_attachments_info :: proc(atts: Attachments) -> Attachments_Info ---

    @(link_name="sg_query_buffer_desc", private)
    sg_query_buffer_desc :: proc(buf: Sokol_GFX_Buffer) -> Buffer_Desc ---

    @(link_name="sg_query_image_desc", private)
    sg_query_image_desc :: proc(img: Texture) -> Sokol_GFX_Image_Desc ---

    @(link_name="sg_query_sampler_desc", private)
    sg_query_sampler_desc :: proc(smp: Sampler) -> Sampler_Desc ---

    @(link_name="sg_query_shader_desc", private)
    sg_query_shader_desc :: proc(shd: Shader) -> Shader_Desc ---

    @(link_name="sg_query_pipeline_desc", private)
    sg_query_pipeline_desc :: proc(pip: Pipeline) -> Pipeline_Desc ---

    @(link_name="sg_query_attachments_desc", private)
    sg_query_attachments_desc :: proc(atts: Attachments) -> Attachments_Desc ---

    @(link_name="sg_query_buffer_defaults", private)
    sg_query_buffer_defaults :: proc(#by_ptr desc: Buffer_Desc) -> Buffer_Desc ---

    @(link_name="sg_query_image_defaults", private)
    sg_query_image_defaults :: proc(#by_ptr desc: Sokol_GFX_Image_Desc) -> Sokol_GFX_Image_Desc ---

    @(link_name="sg_query_sampler_defaults", private)
    sg_query_sampler_defaults :: proc(#by_ptr desc: Sampler_Desc) -> Sampler_Desc ---

    @(link_name="sg_query_shader_defaults", private)
    sg_query_shader_defaults :: proc(#by_ptr desc: Shader_Desc) -> Shader_Desc ---

    @(link_name="sg_query_pipeline_defaults", private)
    sg_query_pipeline_defaults :: proc(#by_ptr desc: Pipeline_Desc) -> Pipeline_Desc ---

    @(link_name="sg_query_attachments_defaults", private)
    sg_query_attachments_defaults :: proc(#by_ptr desc: Attachments_Desc) -> Attachments_Desc ---

    @(link_name="sg_alloc_buffer", private)
    sg_alloc_buffer :: proc() -> Sokol_GFX_Buffer ---

    @(link_name="sg_alloc_image", private)
    sg_alloc_image :: proc() -> Texture ---

    @(link_name="sg_alloc_sampler", private)
    sg_alloc_sampler :: proc() -> Sampler ---

    @(link_name="sg_alloc_shader", private)
    sg_alloc_shader :: proc() -> Shader ---

    @(link_name="sg_alloc_pipeline", private)
    sg_alloc_pipeline :: proc() -> Pipeline ---

    @(link_name="sg_alloc_attachments", private)
    sg_alloc_attachments :: proc() -> Attachments ---

    @(link_name="sg_dealloc_buffer", private)
    sg_dealloc_buffer :: proc(buf: Sokol_GFX_Buffer)  ---

    @(link_name="sg_dealloc_image", private)
    sg_dealloc_image :: proc(img: Texture)  ---

    @(link_name="sg_dealloc_sampler", private)
    sg_dealloc_sampler :: proc(smp: Sampler)  ---

    @(link_name="sg_dealloc_shader", private)
    sg_dealloc_shader :: proc(shd: Shader)  ---

    @(link_name="sg_dealloc_pipeline", private)
    sg_dealloc_pipeline :: proc(pip: Pipeline)  ---

    @(link_name="sg_dealloc_attachments", private)
    sg_dealloc_attachments :: proc(attachments: Attachments)  ---

    @(link_name="sg_init_buffer", private)
    sg_init_buffer :: proc(buf: Sokol_GFX_Buffer, desc: ^Buffer_Desc) ---

    @(link_name="sg_init_image", private)
    sg_init_image :: proc(img: Texture, #by_ptr desc: Sokol_GFX_Image_Desc)  ---

    @(link_name="sg_init_sampler", private)
    sg_init_sampler :: proc(smg: Sampler, #by_ptr desc: Sampler_Desc)  ---

    @(link_name="sg_init_shader", private)
    sg_init_shader :: proc(shd: Shader, #by_ptr desc: Shader_Desc)  ---

    @(link_name="sg_init_pipeline", private)
    sg_init_pipeline :: proc(pip: Pipeline, #by_ptr desc: Pipeline_Desc)  ---

    @(link_name="sg_init_attachments", private)
    sg_init_attachments :: proc(attachments: Attachments, #by_ptr desc: Attachments_Desc)  ---

    @(link_name="sg_uninit_buffer", private)
    sg_uninit_buffer :: proc(buf: Sokol_GFX_Buffer)  ---

    @(link_name="sg_uninit_image", private)
    sg_uninit_image :: proc(img: Texture)  ---

    @(link_name="sg_uninit_sampler", private)
    sg_uninit_sampler :: proc(smp: Sampler)  ---

    @(link_name="sg_uninit_shader", private)
    sg_uninit_shader :: proc(shd: Shader)  ---

    @(link_name="sg_uninit_pipeline", private)
    sg_uninit_pipeline :: proc(pip: Pipeline)  ---

    @(link_name="sg_uninit_attachments", private)
    sg_uninit_attachments :: proc(atts: Attachments)  ---

    @(link_name="sg_fail_buffer", private)
    sg_fail_buffer :: proc(buf: Sokol_GFX_Buffer)  ---

    @(link_name="sg_fail_image", private)
    sg_fail_image :: proc(img: Texture)  ---

    @(link_name="sg_fail_sampler", private)
    sg_fail_sampler :: proc(smp: Sampler)  ---

    @(link_name="sg_fail_shader", private)
    sg_fail_shader :: proc(shd: Shader)  ---

    @(link_name="sg_fail_pipeline", private)
    sg_fail_pipeline :: proc(pip: Pipeline)  ---

    @(link_name="sg_fail_attachments", private)
    sg_fail_attachments :: proc(atts: Attachments)  ---

    @(link_name="sg_enable_frame_stats", private)
    sg_enable_frame_stats :: proc()  ---

    @(link_name="sg_disable_frame_stats", private)
    sg_disable_frame_stats :: proc()  ---

    @(link_name="sg_frame_stats_enabled", private)
    sg_frame_stats_enabled :: proc() -> bool ---

    @(link_name="sg_query_frame_stats", private)
    sg_query_frame_stats :: proc() -> Frame_Stats ---

    @(link_name="sg_d3d11_device", private)
    sg_d3d11_device :: proc() -> rawptr ---

    @(link_name="sg_d3d11_device_context", private)
    sg_d3d11_device_context :: proc() -> rawptr ---

    @(link_name="sg_d3d11_query_buffer_info", private)
    sg_d3d11_query_buffer_info :: proc(buf: Sokol_GFX_Buffer) -> D3d11_Buffer_Info ---

    @(link_name="sg_d3d11_query_image_info", private)
    sg_d3d11_query_image_info :: proc(img: Texture) -> D3d11_Graphics_Image_Info ---

    @(link_name="sg_d3d11_query_sampler_info", private)
    sg_d3d11_query_sampler_info :: proc(smp: Sampler) -> D3d11_Sampler_Info ---

    @(link_name="sg_d3d11_query_shader_info", private)
    sg_d3d11_query_shader_info :: proc(shd: Shader) -> D3d11_Shader_Info ---

    @(link_name="sg_d3d11_query_pipeline_info", private)
    sg_d3d11_query_pipeline_info :: proc(pip: Pipeline) -> D3d11_Pipeline_Info ---

    @(link_name="sg_d3d11_query_attachments_info", private)
    sg_d3d11_query_attachments_info :: proc(atts: Attachments) -> D3d11_Attachments_Info ---

    @(link_name="sg_mtl_device", private)
    sg_mtl_device :: proc() -> rawptr ---

    @(link_name="sg_mtl_render_command_encoder", private)
    sg_mtl_render_command_encoder :: proc() -> rawptr ---

    @(link_name="sg_mtl_query_buffer_info", private)
    sg_mtl_query_buffer_info :: proc(buf: Sokol_GFX_Buffer) -> Mtl_Buffer_Info ---

    @(link_name="sg_mtl_query_image_info", private)
    sg_mtl_query_image_info :: proc(img: Texture) -> Mtl_Graphics_Image_Info ---

    @(link_name="sg_mtl_query_sampler_info", private)
    sg_mtl_query_sampler_info :: proc(smp: Sampler) -> Mtl_Sampler_Info ---

    @(link_name="sg_mtl_query_shader_info", private)
    sg_mtl_query_shader_info :: proc(shd: Shader) -> Mtl_Shader_Info ---

    @(link_name="sg_mtl_query_pipeline_info", private)
    sg_mtl_query_pipeline_info :: proc(pip: Pipeline) -> Mtl_Pipeline_Info ---

    @(link_name="sg_wgpu_device", private)
    sg_wgpu_device :: proc() -> rawptr ---

    @(link_name="sg_wgpu_queue", private)
    sg_wgpu_queue :: proc() -> rawptr ---

    @(link_name="sg_wgpu_command_encoder", private)
    sg_wgpu_command_encoder :: proc() -> rawptr ---

    @(link_name="sg_wgpu_render_pass_encoder", private)
    sg_wgpu_render_pass_encoder :: proc() -> rawptr ---

    @(link_name="sg_wgpu_query_buffer_info", private)
    sg_wgpu_query_buffer_info :: proc(buf: Sokol_GFX_Buffer) -> Wgpu_Buffer_Info ---

    @(link_name="sg_wgpu_query_image_info", private)
    sg_wgpu_query_image_info :: proc(img: Texture) -> Wgpu_Graphics_Image_Info ---

    @(link_name="sg_wgpu_query_sampler_info", private)
    sg_wgpu_query_sampler_info :: proc(smp: Sampler) -> Wgpu_Sampler_Info ---

    @(link_name="sg_wgpu_query_shader_info", private)
    sg_wgpu_query_shader_info :: proc(shd: Shader) -> Wgpu_Shader_Info ---

    @(link_name="sg_wgpu_query_pipeline_info", private)
    sg_wgpu_query_pipeline_info :: proc(pip: Pipeline) -> Wgpu_Pipeline_Info ---

    @(link_name="sg_wgpu_query_attachments_info", private)
    sg_wgpu_query_attachments_info :: proc(atts: Attachments) -> Wgpu_Attachments_Info ---

    @(link_name="sg_gl_query_buffer_info", private)
    sg_gl_query_buffer_info :: proc(buf: Sokol_GFX_Buffer) -> Gl_Buffer_Info ---

    @(link_name="sg_gl_query_image_info", private)
    sg_gl_query_image_info :: proc(img: Texture) -> Gl_Graphics_Image_Info ---

    @(link_name="sg_gl_query_sampler_info", private)
    sg_gl_query_sampler_info :: proc(smp: Sampler) -> Gl_Sampler_Info ---

    @(link_name="sg_gl_query_shader_info", private)
    sg_gl_query_shader_info :: proc(shd: Shader) -> Gl_Shader_Info ---

    @(link_name="sg_gl_query_attachments_info", private)
    sg_gl_query_attachments_info :: proc(atts: Attachments) -> Gl_Attachments_Info ---

}

@(private)
Sokol_GFX_Buffer :: u32

Texture :: u32
Sampler :: u32
Shader :: u32
Pipeline :: u32
Attachments :: u32

@(private)
Range :: struct
{
    ptr: rawptr,
    size: u64,
}

INVALID_ID :: 0
NUM_SHADER_STAGES :: 2
NUM_INFLIGHT_FRAMES :: 2
MAX_COLOR_ATTACHMENTS :: 4
MAX_VERTEX_BUFFERS :: 8
MAX_SHADER_STAGE_TEXTURES :: 12
MAX_SHADER_STAGE_SAMPLERS :: 8
MAX_SHADER_STAGE_IMAGESAMPLERPAIRS :: 12
MAX_SHADER_STAGE_UBS :: 4
MAX_UB_MEMBERS :: 16
MAX_VERTEX_ATTRIBUTES :: 16
MAX_MIPMAPS :: 16
MAX_TEXTUREARRAY_LAYERS :: 128

Color :: [4]f32

Graphics_Backend :: enum i32
{
    GL_Core_33,
    GL_ES_3,
    D3D11,
    Metal_IOS,
    Metal_Mac_OS,
    Metal_Simulator,
    WGPU,
    Dummy,
}

Pixel_Format :: enum i32
{
    Default,
    None,
    R8,
    R8SN,
    R8UI,
    R8SI,
    R16,
    R16SN,
    R16UI,
    R16SI,
    R16F,
    RG8,
    RG8SN,
    RG8UI,
    RG8SI,
    R32UI,
    R32SI,
    R32F,
    RG16,
    RG16SN,
    RG16UI,
    RG16SI,
    RG16F,
    RGBA8,
    SRGB8A8,
    RGBA8SN,
    RGBA8UI,
    RGBA8SI,
    BGRA8,
    RGB10A2,
    RG11B10F,
    RGB9E5,
    RG32UI,
    RG32SI,
    RG32F,
    RGBA16,
    RGBA16SN,
    RGBA16UI,
    RGBA16SI,
    RGBA16F,
    RGBA32UI,
    RGBA32SI,
    RGBA32F,
    Depth,
    Depth_Stencil,
    BC1_RGBA,
    BC2_RGBA,
    BC3_RGBA,
    BC3_SRGBA,
    BC4_R,
    BC4_RSN,
    BC5_RG,
    BC5_RGSN,
    BC6H_RGBF,
    BC6H_RGBUF,
    BC7_RGBA,
    BC7_SRGBA,
    PVRTC_RGB_2BPP,
    PVRTC_RGB_4BPP,
    PVRTC_RGBA_2BPP,
    PVRTC_RGBA_4BPP,
    ETC2_RGB8,
    ETC2_SRGB8,
    ETC2_RGB8A1,
    ETC2_RGBA8,
    ETC2_SRGB8A8,
    ETC2_RG11,
    ETC2_RG11SN,
    ASTC_4x4_RGBA,
    ASTC_4x4_SRGBA,
}

Pixel_Format_Info :: struct
{
    sample: bool,
    filter: bool,
    render: bool,
    blend: bool,
    msaa: bool,
    depth: bool,
    compressed: bool,
    bytes_per_pixel: i32,
}

Graphics_Features :: struct
{
    origin_top_left: bool,
    image_clamp_to_border: bool,
    mrt_independent_blend_state: bool,
    mrt_independent_write_mask: bool,
}

Limits :: struct {
    max_image_size_2d : i32,
    max_image_size_cube : i32,
    max_image_size_3d : i32,
    max_image_size_array : i32,
    max_image_array_layers : i32,
    max_vertex_attrs : i32,
    gl_max_vertex_uniform_components : i32,
    gl_max_combined_texture_image_units : i32,
}
Resource_State :: enum i32 {
    INITIAL,
    ALLOC,
    VALID,
    FAILED,
    INVALID,
}

Usage :: enum i32
{
    Default,
    Immutable,
    Dynamic,
    Stream,
}

Buffer_Type :: enum i32
{
    Default,
    Vertex_Buffer,
    Index_Buffer,
}

Index_Type :: enum i32
{
    None,
    U16,
    U32,
}

Texture_Type :: enum i32
{
    _2D = 1,
    Cube,
    _3D,
    Array,
}

Texture_Sample_Type :: enum i32
{
    Default,
    Float = 1,
    Depth,
    Signed_Int,
    Unsigned_Int,
    Unfilterable_Float,
}

Sampler_Type :: enum i32
{
    Default,
    Filtering = 1,
    Non_Filtering,
    Comparison,
}

Cube_Face :: enum i32
{
    Positive_X,
    Negative_X,
    Positive_Y,
    Negative_Y,
    Positive_Z,
    Negative_Z,
}

Shader_Stage :: enum i32
{
    VS,
    FS,
}

Primitive_Type :: enum i32
{
    //DEFAULT,
    Points,
    Lines,
    Line_Strip,
    Triangles,
    Triangle_Strip,
}

Filter :: enum i32 {
    DEFAULT,
    NONE,
    NEAREST,
    LINEAR,
    NUM,
}
Wrap :: enum i32 {
    DEFAULT,
    REPEAT,
    CLAMP_TO_EDGE,
    CLAMP_TO_BORDER,
    MIRRORED_REPEAT,
    NUM,
}
Border_Color :: enum i32 {
    DEFAULT,
    TRANSPARENT_BLACK,
    OPAQUE_BLACK,
    OPAQUE_WHITE,
    NUM,
}

Vertex_Format :: enum i32
{
    //Invalid     = 0,
    F32         = 1,
    Vector2     = 2,
    Vector3     = 3,
    Vector4     = 4,
    // BYTE4       = 5,
    // BYTE4N      = 6,
    // UBYTE4      = 7,
    // UBYTE4N     = 8,
    // SHORT2      = 9,
    // SHORT2N     = 10,
    // USHORT2N    = 11,
    // SHORT4      = 12,
    // SHORT4N     = 13,
    // USHORT4N    = 14,
    // UINT10_N2   = 15,
    // HALF2       = 16,
    // HALF4       = 17,
}

Vertex_Step :: enum i32
{
    //DEFAULT,
    Per_Vertex,
    Per_Instance,
}

Uniform_Type :: enum i32
{
    Invalid,
    F32,
    Vector2,
    Vector3,
    Vector4,
    I32,
    IVector2,
    IVector3,
    IVector4,
    Matrix4,
}

Uniform_Layout :: enum i32
{
    //DEFAULT,
    Native,
    STD140,
}

Cull_Mode :: enum i32
{
    //DEFAULT,
    None,
    Front,
    Back,
}

Face_Winding :: enum i32
{
    //DEFAULT,
    Counter_Clockwise,
    Clockwise,
}

Compare_Func :: enum i32
{
    DEFAULT,
    NEVER,
    LESS,
    EQUAL,
    LESS_EQUAL,
    GREATER,
    NOT_EQUAL,
    GREATER_EQUAL,
    ALWAYS,
    NUM,
}

Stencil_Op :: enum i32 {
    DEFAULT,
    KEEP,
    ZERO,
    REPLACE,
    INCR_CLAMP,
    DECR_CLAMP,
    INVERT,
    INCR_WRAP,
    DECR_WRAP,
    NUM,
}
Blend_Factor :: enum i32 {
    DEFAULT,
    ZERO,
    ONE,
    SRC_COLOR,
    ONE_MINUS_SRC_COLOR,
    SRC_ALPHA,
    ONE_MINUS_SRC_ALPHA,
    DST_COLOR,
    ONE_MINUS_DST_COLOR,
    DST_ALPHA,
    ONE_MINUS_DST_ALPHA,
    SRC_ALPHA_SATURATED,
    BLEND_COLOR,
    ONE_MINUS_BLEND_COLOR,
    BLEND_ALPHA,
    ONE_MINUS_BLEND_ALPHA,
    NUM,
}
Blend_Op :: enum i32 {
    DEFAULT,
    ADD,
    SUBTRACT,
    REVERSE_SUBTRACT,
    NUM,
}
Color_Mask :: enum i32 {
    DEFAULT = 0,
    NONE = 16,
    R = 1,
    G = 2,
    RG = 3,
    B = 4,
    RB = 5,
    GB = 6,
    RGB = 7,
    A = 8,
    RA = 9,
    GA = 10,
    RGA = 11,
    BA = 12,
    RBA = 13,
    GBA = 14,
    RGBA = 15,
}

Pass_Load_Action :: enum i32
{
    Default,
    Clear,
    Load,
    Dont_Care,
}

Pass_Store_Action :: enum i32
{
    Default,
    Store,
    Dont_Care,
}

Pass_Color_Attachment_Action :: struct
{
    load_action : Pass_Load_Action,
    store_action : Pass_Store_Action,
    clear_value : Color,
}

Pass_Depth_Attachment_Action :: struct
{
    load_action : Pass_Load_Action,
    store_action : Pass_Store_Action,
    clear_value : f32,
}

Pass_Stencil_Attachment_Action :: struct
{
    load_action : Pass_Load_Action,
    store_action : Pass_Store_Action,
    clear_value : u8,
}

Pass_Action :: struct
{
    colors: [4]Pass_Color_Attachment_Action,
    depth: Pass_Depth_Attachment_Action,
    stencil: Pass_Stencil_Attachment_Action,
}

Metal_Swapchain :: struct
{
    current_drawable,
    depth_stencil_texture,
    msaa_color_texture: rawptr,
}

D3D11_Swapchain :: struct
{
    render_view,
    resolve_view,
    depth_stencil_view: rawptr,
}

WGPU_Swapchain :: struct
{
    render_view,
    resolve_view,
    depth_stencil_view: rawptr,
}

GL_Swapchain :: struct
{
    framebuffer : u32,
}

Swapchain :: struct
{
    width: i32,
    height: i32,
    sample_count: i32,
    color_format: Pixel_Format,
    depth_format: Pixel_Format,
    metal: Metal_Swapchain,
    d3d11: D3D11_Swapchain,
    wgpu: WGPU_Swapchain,
    gl: GL_Swapchain,
}

Pass :: struct
{
    _: u32,
    action: Pass_Action,
    attachments: Attachments,
    swapchain: Swapchain,
    label: cstring,
    _: u32,
}

Stage_Bindings :: struct
{
    textures: [MAX_SHADER_STAGE_TEXTURES]Texture,
    samplers: [MAX_SHADER_STAGE_SAMPLERS]Sampler,
}

Bindings :: struct
{
    _: u32,
    vertex_buffers: [8]Sokol_GFX_Buffer,
    vertex_buffer_offsets: [8]i32,
    index_buffer: Sokol_GFX_Buffer,
    index_buffer_offset: i32,
    vs: Stage_Bindings,
    fs: Stage_Bindings,
    _: u32,
}

@(private)
Sokol_GFX_Buffer_Desc :: Buffer_Desc

@(private)
Buffer_Desc :: struct
{
    _ : u32,
    size : u64,
    type : Buffer_Type,
    usage : Usage,
    data : Range,
    label : cstring,
    gl_buffers : [2]u32,
    mtl_buffers : [2]rawptr,
    d3d11_buffer : rawptr,
    wgpu_buffer : rawptr,
    _ : u32,
}

Graphics_Image_Data :: struct
{
    subimage : [6][16]Range,
}

@(private)
Sokol_GFX_Image_Desc :: struct
{
    _: u32,
    type: Texture_Type,
    render_target: bool,
    width: i32,
    height: i32,
    num_slices: i32,
    num_mipmaps: i32,
    usage: Usage,
    pixel_format: Pixel_Format,
    sample_count: i32,
    data: Graphics_Image_Data,
    label: cstring,
    gl_textures: [2]u32,
    gl_texture_target: u32,
    mtl_textures: [2]rawptr,
    d3d11_texture: rawptr,
    d3d11_shader_resource_view: rawptr,
    wgpu_texture: rawptr,
    wgpu_texture_view: rawptr,
    _: u32,
}

Sampler_Desc :: struct {
    _ : u32,
    min_filter : Filter,
    mag_filter : Filter,
    mipmap_filter : Filter,
    wrap_u : Wrap,
    wrap_v : Wrap,
    wrap_w : Wrap,
    min_lod : f32,
    max_lod : f32,
    border_color : Border_Color,
    compare : Compare_Func,
    max_anisotropy : u32,
    label : cstring,
    gl_sampler : u32,
    mtl_sampler : rawptr,
    d3d11_sampler : rawptr,
    wgpu_sampler : rawptr,
    _ : u32,
}
Shader_Attr_Desc :: struct {
    name : cstring,
    sem_name : cstring,
    sem_index : i32,
}
Shader_Uniform_Desc :: struct {
    name : cstring,
    type : Uniform_Type,
    array_count : i32,
}
Shader_Uniform_Block_Desc :: struct {
    size : u64,
    layout : Uniform_Layout,
    uniforms : [16]Shader_Uniform_Desc,
}
Shader_Graphics_Image_Desc :: struct {
    used : bool,
    multisampled : bool,
    image_type : Texture_Type,
    sample_type : Texture_Sample_Type,
}
Shader_Sampler_Desc :: struct {
    used : bool,
    sampler_type : Sampler_Type,
}
Shader_Graphics_Image_Sampler_Pair_Desc :: struct {
    used : bool,
    image_slot : i32,
    sampler_slot : i32,
    glsl_name : cstring,
}
Shader_Stage_Desc :: struct {
    source : cstring,
    bytecode : Range,
    entry : cstring,
    d3d11_target : cstring,
    uniform_blocks : [4]Shader_Uniform_Block_Desc,
    images : [12]Shader_Graphics_Image_Desc,
    samplers : [8]Shader_Sampler_Desc,
    image_sampler_pairs : [12]Shader_Graphics_Image_Sampler_Pair_Desc,
}
Shader_Desc :: struct {
    _ : u32,
    attrs : [16]Shader_Attr_Desc,
    vs : Shader_Stage_Desc,
    fs : Shader_Stage_Desc,
    label : cstring,
    _ : u32,
}
Vertex_Buffer_Layout_State :: struct {
    stride : i32,
    step_func : Vertex_Step,
    step_rate : i32,
}
Vertex_Attr_State :: struct {
    buffer_index : i32,
    offset : i32,
    format : Vertex_Format,
}
Vertex_Layout_State :: struct {
    buffers : [8]Vertex_Buffer_Layout_State,
    attrs : [16]Vertex_Attr_State,
}
Stencil_Face_State :: struct {
    compare : Compare_Func,
    fail_op : Stencil_Op,
    depth_fail_op : Stencil_Op,
    pass_op : Stencil_Op,
}
Stencil_State :: struct {
    enabled : bool,
    front : Stencil_Face_State,
    back : Stencil_Face_State,
    read_mask : u8,
    write_mask : u8,
    ref : u8,
}
Depth_State :: struct {
    pixel_format : Pixel_Format,
    compare : Compare_Func,
    write_enabled : bool,
    bias : f32,
    bias_slope_scale : f32,
    bias_clamp : f32,
}
Blend_State :: struct {
    enabled : bool,
    src_factor_rgb : Blend_Factor,
    dst_factor_rgb : Blend_Factor,
    op_rgb : Blend_Op,
    src_factor_alpha : Blend_Factor,
    dst_factor_alpha : Blend_Factor,
    op_alpha : Blend_Op,
}
Color_Target_State :: struct {
    pixel_format : Pixel_Format,
    write_mask : Color_Mask,
    blend : Blend_State,
}
Pipeline_Desc :: struct {
    _ : u32,
    shader : Shader,
    layout : Vertex_Layout_State,
    depth : Depth_State,
    stencil : Stencil_State,
    color_count : i32,
    colors : [4]Color_Target_State,
    primitive_type : Primitive_Type,
    index_type : Index_Type,
    cull_mode : Cull_Mode,
    face_winding : Face_Winding,
    sample_count : i32,
    blend_color : Color,
    alpha_to_coverage_enabled : bool,
    label : cstring,
    _ : u32,
}
Attachment_Desc :: struct {
    image : Texture,
    mip_level : i32,
    slice : i32,
}
Attachments_Desc :: struct {
    _ : u32,
    colors : [4]Attachment_Desc,
    resolves : [4]Attachment_Desc,
    depth_stencil : Attachment_Desc,
    label : cstring,
    _ : u32,
}
Slot_Info :: struct {
    state : Resource_State,
    res_id : u32,
}

Buffer_Info :: struct
{
    slot: Slot_Info,
    update_frame_index: u32,
    append_frame_index: u32,
    append_pos: i32,
    append_overflow: bool,
    num_slots: i32,
    active_slot: i32,
}

Texture_Info :: struct
{
    slot: Slot_Info,
    upd_frame_index: u32,
    num_slots: i32,
    active_slot: i32,
}

Sampler_Info :: struct {
    slot : Slot_Info,
}
Shader_Info :: struct {
    slot : Slot_Info,
}
Pipeline_Info :: struct {
    slot : Slot_Info,
}
Attachments_Info :: struct {
    slot : Slot_Info,
}
Frame_Stats_Gl :: struct {
    num_bind_buffer : u32,
    num_active_texture : u32,
    num_bind_texture : u32,
    num_bind_sampler : u32,
    num_use_program : u32,
    num_render_state : u32,
    num_vertex_attrib_pointer : u32,
    num_vertex_attrib_divisor : u32,
    num_enable_vertex_attrib_array : u32,
    num_disable_vertex_attrib_array : u32,
    num_uniform : u32,
}
Frame_Stats_D3d11_Pass :: struct {
    num_om_set_render_targets : u32,
    num_clear_render_target_view : u32,
    num_clear_depth_stencil_view : u32,
    num_resolve_subresource : u32,
}
Frame_Stats_D3d11_Pipeline :: struct {
    num_rs_set_state : u32,
    num_om_set_depth_stencil_state : u32,
    num_om_set_blend_state : u32,
    num_ia_set_primitive_topology : u32,
    num_ia_set_input_layout : u32,
    num_vs_set_shader : u32,
    num_vs_set_constant_buffers : u32,
    num_ps_set_shader : u32,
    num_ps_set_constant_buffers : u32,
}
Frame_Stats_D3d11_Bindings :: struct {
    num_ia_set_vertex_buffers : u32,
    num_ia_set_index_buffer : u32,
    num_vs_set_shader_resources : u32,
    num_ps_set_shader_resources : u32,
    num_vs_set_samplers : u32,
    num_ps_set_samplers : u32,
}
Frame_Stats_D3d11_Uniforms :: struct {
    num_update_subresource : u32,
}
Frame_Stats_D3d11_Draw :: struct {
    num_draw_indexed_instanced : u32,
    num_draw_indexed : u32,
    num_draw_instanced : u32,
    num_draw : u32,
}
Frame_Stats_D3d11 :: struct {
    pass : Frame_Stats_D3d11_Pass,
    pipeline : Frame_Stats_D3d11_Pipeline,
    bindings : Frame_Stats_D3d11_Bindings,
    uniforms : Frame_Stats_D3d11_Uniforms,
    draw : Frame_Stats_D3d11_Draw,
    num_map : u32,
    num_unmap : u32,
}
Frame_Stats_Metal_Idpool :: struct {
    num_added : u32,
    num_released : u32,
    num_garbage_collected : u32,
}
Frame_Stats_Metal_Pipeline :: struct {
    num_set_blend_color : u32,
    num_set_cull_mode : u32,
    num_set_front_facing_winding : u32,
    num_set_stencil_reference_value : u32,
    num_set_depth_bias : u32,
    num_set_render_pipeline_state : u32,
    num_set_depth_stencil_state : u32,
}
Frame_Stats_Metal_Bindings :: struct {
    num_set_vertex_buffer : u32,
    num_set_vertex_texture : u32,
    num_set_vertex_sampler_state : u32,
    num_set_fragment_texture : u32,
    num_set_fragment_sampler_state : u32,
}
Frame_Stats_Metal_Uniforms :: struct {
    num_set_vertex_buffer_offset : u32,
    num_set_fragment_buffer_offset : u32,
}
Frame_Stats_Metal :: struct {
    idpool : Frame_Stats_Metal_Idpool,
    pipeline : Frame_Stats_Metal_Pipeline,
    bindings : Frame_Stats_Metal_Bindings,
    uniforms : Frame_Stats_Metal_Uniforms,
}
Frame_Stats_Wgpu_Uniforms :: struct {
    num_set_bindgroup : u32,
    size_write_buffer : u32,
}
Frame_Stats_Wgpu_Bindings :: struct {
    num_set_vertex_buffer : u32,
    num_skip_redundant_vertex_buffer : u32,
    num_set_index_buffer : u32,
    num_skip_redundant_index_buffer : u32,
    num_create_bindgroup : u32,
    num_discard_bindgroup : u32,
    num_set_bindgroup : u32,
    num_skip_redundant_bindgroup : u32,
    num_bindgroup_cache_hits : u32,
    num_bindgroup_cache_misses : u32,
    num_bindgroup_cache_collisions : u32,
    num_bindgroup_cache_hash_vs_key_mismatch : u32,
}
Frame_Stats_Wgpu :: struct {
    uniforms : Frame_Stats_Wgpu_Uniforms,
    bindings : Frame_Stats_Wgpu_Bindings,
}
Frame_Stats :: struct {
    frame_index : u32,
    num_passes : u32,
    num_apply_viewport : u32,
    num_apply_scissor_rect : u32,
    num_apply_pipeline : u32,
    num_apply_bindings : u32,
    num_apply_uniforms : u32,
    num_draw : u32,
    num_update_buffer : u32,
    num_append_buffer : u32,
    num_update_image : u32,
    size_apply_uniforms : u32,
    size_update_buffer : u32,
    size_append_buffer : u32,
    size_update_image : u32,
    gl : Frame_Stats_Gl,
    d3d11 : Frame_Stats_D3d11,
    metal : Frame_Stats_Metal,
    wgpu : Frame_Stats_Wgpu,
}
Log_Item :: enum i32 {
    OK,
    MALLOC_FAILED,
    GL_TEXTURE_FORMAT_NOT_SUPPORTED,
    GL_3D_TEXTURES_NOT_SUPPORTED,
    GL_ARRAY_TEXTURES_NOT_SUPPORTED,
    GL_SHADER_COMPILATION_FAILED,
    GL_SHADER_LINKING_FAILED,
    GL_VERTEX_ATTRIBUTE_NOT_FOUND_IN_SHADER,
    GL_TEXTURE_NAME_NOT_FOUND_IN_SHADER,
    GL_FRAMEBUFFER_STATUS_UNDEFINED,
    GL_FRAMEBUFFER_STATUS_INCOMPLETE_ATTACHMENT,
    GL_FRAMEBUFFER_STATUS_INCOMPLETE_MISSING_ATTACHMENT,
    GL_FRAMEBUFFER_STATUS_UNSUPPORTED,
    GL_FRAMEBUFFER_STATUS_INCOMPLETE_MULTISAMPLE,
    GL_FRAMEBUFFER_STATUS_UNKNOWN,
    D3D11_CREATE_BUFFER_FAILED,
    D3D11_CREATE_DEPTH_TEXTURE_UNSUPPORTED_PIXEL_FORMAT,
    D3D11_CREATE_DEPTH_TEXTURE_FAILED,
    D3D11_CREATE_2D_TEXTURE_UNSUPPORTED_PIXEL_FORMAT,
    D3D11_CREATE_2D_TEXTURE_FAILED,
    D3D11_CREATE_2D_SRV_FAILED,
    D3D11_CREATE_3D_TEXTURE_UNSUPPORTED_PIXEL_FORMAT,
    D3D11_CREATE_3D_TEXTURE_FAILED,
    D3D11_CREATE_3D_SRV_FAILED,
    D3D11_CREATE_MSAA_TEXTURE_FAILED,
    D3D11_CREATE_SAMPLER_STATE_FAILED,
    D3D11_LOAD_D3DCOMPILER_47_DLL_FAILED,
    D3D11_SHADER_COMPILATION_FAILED,
    D3D11_SHADER_COMPILATION_OUTPUT,
    D3D11_CREATE_CONSTANT_BUFFER_FAILED,
    D3D11_CREATE_INPUT_LAYOUT_FAILED,
    D3D11_CREATE_RASTERIZER_STATE_FAILED,
    D3D11_CREATE_DEPTH_STENCIL_STATE_FAILED,
    D3D11_CREATE_BLEND_STATE_FAILED,
    D3D11_CREATE_RTV_FAILED,
    D3D11_CREATE_DSV_FAILED,
    D3D11_MAP_FOR_UPDATE_BUFFER_FAILED,
    D3D11_MAP_FOR_APPEND_BUFFER_FAILED,
    D3D11_MAP_FOR_UPDATE_IMAGE_FAILED,
    METAL_CREATE_BUFFER_FAILED,
    METAL_TEXTURE_FORMAT_NOT_SUPPORTED,
    METAL_CREATE_TEXTURE_FAILED,
    METAL_CREATE_SAMPLER_FAILED,
    METAL_SHADER_COMPILATION_FAILED,
    METAL_SHADER_CREATION_FAILED,
    METAL_SHADER_COMPILATION_OUTPUT,
    METAL_VERTEX_SHADER_ENTRY_NOT_FOUND,
    METAL_FRAGMENT_SHADER_ENTRY_NOT_FOUND,
    METAL_CREATE_RPS_FAILED,
    METAL_CREATE_RPS_OUTPUT,
    METAL_CREATE_DSS_FAILED,
    WGPU_BINDGROUPS_POOL_EXHAUSTED,
    WGPU_BINDGROUPSCACHE_SIZE_GREATER_ONE,
    WGPU_BINDGROUPSCACHE_SIZE_POW2,
    WGPU_CREATEBINDGROUP_FAILED,
    WGPU_CREATE_BUFFER_FAILED,
    WGPU_CREATE_TEXTURE_FAILED,
    WGPU_CREATE_TEXTURE_VIEW_FAILED,
    WGPU_CREATE_SAMPLER_FAILED,
    WGPU_CREATE_SHADER_MODULE_FAILED,
    WGPU_SHADER_TOO_MANY_IMAGES,
    WGPU_SHADER_TOO_MANY_SAMPLERS,
    WGPU_SHADER_CREATE_BINDGROUP_LAYOUT_FAILED,
    WGPU_CREATE_PIPELINE_LAYOUT_FAILED,
    WGPU_CREATE_RENDER_PIPELINE_FAILED,
    WGPU_ATTACHMENTS_CREATE_TEXTURE_VIEW_FAILED,
    IDENTICAL_COMMIT_LISTENER,
    COMMIT_LISTENER_ARRAY_FULL,
    TRACE_HOOKS_NOT_ENABLED,
    DEALLOC_BUFFER_INVALID_STATE,
    DEALLOC_IMAGE_INVALID_STATE,
    DEALLOC_SAMPLER_INVALID_STATE,
    DEALLOC_SHADER_INVALID_STATE,
    DEALLOC_PIPELINE_INVALID_STATE,
    DEALLOC_ATTACHMENTS_INVALID_STATE,
    INIT_BUFFER_INVALID_STATE,
    INIT_IMAGE_INVALID_STATE,
    INIT_SAMPLER_INVALID_STATE,
    INIT_SHADER_INVALID_STATE,
    INIT_PIPELINE_INVALID_STATE,
    INIT_ATTACHMENTS_INVALID_STATE,
    UNINIT_BUFFER_INVALID_STATE,
    UNINIT_IMAGE_INVALID_STATE,
    UNINIT_SAMPLER_INVALID_STATE,
    UNINIT_SHADER_INVALID_STATE,
    UNINIT_PIPELINE_INVALID_STATE,
    UNINIT_ATTACHMENTS_INVALID_STATE,
    FAIL_BUFFER_INVALID_STATE,
    FAIL_IMAGE_INVALID_STATE,
    FAIL_SAMPLER_INVALID_STATE,
    FAIL_SHADER_INVALID_STATE,
    FAIL_PIPELINE_INVALID_STATE,
    FAIL_ATTACHMENTS_INVALID_STATE,
    BUFFER_POOL_EXHAUSTED,
    IMAGE_POOL_EXHAUSTED,
    SAMPLER_POOL_EXHAUSTED,
    SHADER_POOL_EXHAUSTED,
    PIPELINE_POOL_EXHAUSTED,
    PASS_POOL_EXHAUSTED,
    BEGINPASS_ATTACHMENT_INVALID,
    DRAW_WITHOUT_BINDINGS,
    VALIDATE_BUFFERDESC_CANARY,
    VALIDATE_BUFFERDESC_SIZE,
    VALIDATE_BUFFERDESC_DATA,
    VALIDATE_BUFFERDESC_DATA_SIZE,
    VALIDATE_BUFFERDESC_NO_DATA,
    VALIDATE_IMAGEDATA_NODATA,
    VALIDATE_IMAGEDATA_DATA_SIZE,
    VALIDATE_IMAGEDESC_CANARY,
    VALIDATE_IMAGEDESC_WIDTH,
    VALIDATE_IMAGEDESC_HEIGHT,
    VALIDATE_IMAGEDESC_RT_PIXELFORMAT,
    VALIDATE_IMAGEDESC_NONRT_PIXELFORMAT,
    VALIDATE_IMAGEDESC_MSAA_BUT_NO_RT,
    VALIDATE_IMAGEDESC_NO_MSAA_RT_SUPPORT,
    VALIDATE_IMAGEDESC_MSAA_NUM_MIPMAPS,
    VALIDATE_IMAGEDESC_MSAA_3D_IMAGE,
    VALIDATE_IMAGEDESC_DEPTH_3D_IMAGE,
    VALIDATE_IMAGEDESC_RT_IMMUTABLE,
    VALIDATE_IMAGEDESC_RT_NO_DATA,
    VALIDATE_IMAGEDESC_INJECTED_NO_DATA,
    VALIDATE_IMAGEDESC_DYNAMIC_NO_DATA,
    VALIDATE_IMAGEDESC_COMPRESSED_IMMUTABLE,
    VALIDATE_SAMPLERDESC_CANARY,
    VALIDATE_SAMPLERDESC_MINFILTER_NONE,
    VALIDATE_SAMPLERDESC_MAGFILTER_NONE,
    VALIDATE_SAMPLERDESC_ANISTROPIC_REQUIRES_LINEAR_FILTERING,
    VALIDATE_SHADERDESC_CANARY,
    VALIDATE_SHADERDESC_SOURCE,
    VALIDATE_SHADERDESC_BYTECODE,
    VALIDATE_SHADERDESC_SOURCE_OR_BYTECODE,
    VALIDATE_SHADERDESC_NO_BYTECODE_SIZE,
    VALIDATE_SHADERDESC_NO_CONT_UBS,
    VALIDATE_SHADERDESC_NO_CONT_UB_MEMBERS,
    VALIDATE_SHADERDESC_NO_UB_MEMBERS,
    VALIDATE_SHADERDESC_UB_MEMBER_NAME,
    VALIDATE_SHADERDESC_UB_SIZE_MISMATCH,
    VALIDATE_SHADERDESC_UB_ARRAY_COUNT,
    VALIDATE_SHADERDESC_UB_STD140_ARRAY_TYPE,
    VALIDATE_SHADERDESC_NO_CONT_IMAGES,
    VALIDATE_SHADERDESC_NO_CONT_SAMPLERS,
    VALIDATE_SHADERDESC_IMAGE_SAMPLER_PAIR_IMAGE_SLOT_OUT_OF_RANGE,
    VALIDATE_SHADERDESC_IMAGE_SAMPLER_PAIR_SAMPLER_SLOT_OUT_OF_RANGE,
    VALIDATE_SHADERDESC_IMAGE_SAMPLER_PAIR_NAME_REQUIRED_FOR_GL,
    VALIDATE_SHADERDESC_IMAGE_SAMPLER_PAIR_HAS_NAME_BUT_NOT_USED,
    VALIDATE_SHADERDESC_IMAGE_SAMPLER_PAIR_HAS_IMAGE_BUT_NOT_USED,
    VALIDATE_SHADERDESC_IMAGE_SAMPLER_PAIR_HAS_SAMPLER_BUT_NOT_USED,
    VALIDATE_SHADERDESC_NONFILTERING_SAMPLER_REQUIRED,
    VALIDATE_SHADERDESC_COMPARISON_SAMPLER_REQUIRED,
    VALIDATE_SHADERDESC_IMAGE_NOT_REFERENCED_BY_IMAGE_SAMPLER_PAIRS,
    VALIDATE_SHADERDESC_SAMPLER_NOT_REFERENCED_BY_IMAGE_SAMPLER_PAIRS,
    VALIDATE_SHADERDESC_NO_CONT_IMAGE_SAMPLER_PAIRS,
    VALIDATE_SHADERDESC_ATTR_SEMANTICS,
    VALIDATE_SHADERDESC_ATTR_STRING_TOO_LONG,
    VALIDATE_PIPELINEDESC_CANARY,
    VALIDATE_PIPELINEDESC_SHADER,
    VALIDATE_PIPELINEDESC_NO_ATTRS,
    VALIDATE_PIPELINEDESC_LAYOUT_STRIDE4,
    VALIDATE_PIPELINEDESC_ATTR_SEMANTICS,
    VALIDATE_ATTACHMENTSDESC_CANARY,
    VALIDATE_ATTACHMENTSDESC_NO_ATTACHMENTS,
    VALIDATE_ATTACHMENTSDESC_NO_CONT_COLOR_ATTS,
    VALIDATE_ATTACHMENTSDESC_IMAGE,
    VALIDATE_ATTACHMENTSDESC_MIPLEVEL,
    VALIDATE_ATTACHMENTSDESC_FACE,
    VALIDATE_ATTACHMENTSDESC_LAYER,
    VALIDATE_ATTACHMENTSDESC_SLICE,
    VALIDATE_ATTACHMENTSDESC_IMAGE_NO_RT,
    VALIDATE_ATTACHMENTSDESC_COLOR_INV_PIXELFORMAT,
    VALIDATE_ATTACHMENTSDESC_DEPTH_INV_PIXELFORMAT,
    VALIDATE_ATTACHMENTSDESC_IMAGE_SIZES,
    VALIDATE_ATTACHMENTSDESC_IMAGE_SAMPLE_COUNTS,
    VALIDATE_ATTACHMENTSDESC_RESOLVE_COLOR_IMAGE_MSAA,
    VALIDATE_ATTACHMENTSDESC_RESOLVE_IMAGE,
    VALIDATE_ATTACHMENTSDESC_RESOLVE_SAMPLE_COUNT,
    VALIDATE_ATTACHMENTSDESC_RESOLVE_MIPLEVEL,
    VALIDATE_ATTACHMENTSDESC_RESOLVE_FACE,
    VALIDATE_ATTACHMENTSDESC_RESOLVE_LAYER,
    VALIDATE_ATTACHMENTSDESC_RESOLVE_SLICE,
    VALIDATE_ATTACHMENTSDESC_RESOLVE_IMAGE_NO_RT,
    VALIDATE_ATTACHMENTSDESC_RESOLVE_IMAGE_SIZES,
    VALIDATE_ATTACHMENTSDESC_RESOLVE_IMAGE_FORMAT,
    VALIDATE_ATTACHMENTSDESC_DEPTH_IMAGE,
    VALIDATE_ATTACHMENTSDESC_DEPTH_MIPLEVEL,
    VALIDATE_ATTACHMENTSDESC_DEPTH_FACE,
    VALIDATE_ATTACHMENTSDESC_DEPTH_LAYER,
    VALIDATE_ATTACHMENTSDESC_DEPTH_SLICE,
    VALIDATE_ATTACHMENTSDESC_DEPTH_IMAGE_NO_RT,
    VALIDATE_ATTACHMENTSDESC_DEPTH_IMAGE_SIZES,
    VALIDATE_ATTACHMENTSDESC_DEPTH_IMAGE_SAMPLE_COUNT,
    VALIDATE_BEGINPASS_CANARY,
    VALIDATE_BEGINPASS_ATTACHMENTS_EXISTS,
    VALIDATE_BEGINPASS_ATTACHMENTS_VALID,
    VALIDATE_BEGINPASS_COLOR_ATTACHMENT_IMAGE,
    VALIDATE_BEGINPASS_RESOLVE_ATTACHMENT_IMAGE,
    VALIDATE_BEGINPASS_DEPTHSTENCIL_ATTACHMENT_IMAGE,
    VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_WIDTH,
    VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_WIDTH_NOTSET,
    VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_HEIGHT,
    VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_HEIGHT_NOTSET,
    VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_SAMPLECOUNT,
    VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_SAMPLECOUNT_NOTSET,
    VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_COLORFORMAT,
    VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_COLORFORMAT_NOTSET,
    VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_DEPTHFORMAT_NOTSET,
    VALIDATE_BEGINPASS_SWAPCHAIN_METAL_EXPECT_CURRENTDRAWABLE,
    VALIDATE_BEGINPASS_SWAPCHAIN_METAL_EXPECT_CURRENTDRAWABLE_NOTSET,
    VALIDATE_BEGINPASS_SWAPCHAIN_METAL_EXPECT_DEPTHSTENCILTEXTURE,
    VALIDATE_BEGINPASS_SWAPCHAIN_METAL_EXPECT_DEPTHSTENCILTEXTURE_NOTSET,
    VALIDATE_BEGINPASS_SWAPCHAIN_METAL_EXPECT_MSAACOLORTEXTURE,
    VALIDATE_BEGINPASS_SWAPCHAIN_METAL_EXPECT_MSAACOLORTEXTURE_NOTSET,
    VALIDATE_BEGINPASS_SWAPCHAIN_D3D11_EXPECT_RENDERVIEW,
    VALIDATE_BEGINPASS_SWAPCHAIN_D3D11_EXPECT_RENDERVIEW_NOTSET,
    VALIDATE_BEGINPASS_SWAPCHAIN_D3D11_EXPECT_RESOLVEVIEW,
    VALIDATE_BEGINPASS_SWAPCHAIN_D3D11_EXPECT_RESOLVEVIEW_NOTSET,
    VALIDATE_BEGINPASS_SWAPCHAIN_D3D11_EXPECT_DEPTHSTENCILVIEW,
    VALIDATE_BEGINPASS_SWAPCHAIN_D3D11_EXPECT_DEPTHSTENCILVIEW_NOTSET,
    VALIDATE_BEGINPASS_SWAPCHAIN_WGPU_EXPECT_RENDERVIEW,
    VALIDATE_BEGINPASS_SWAPCHAIN_WGPU_EXPECT_RENDERVIEW_NOTSET,
    VALIDATE_BEGINPASS_SWAPCHAIN_WGPU_EXPECT_RESOLVEVIEW,
    VALIDATE_BEGINPASS_SWAPCHAIN_WGPU_EXPECT_RESOLVEVIEW_NOTSET,
    VALIDATE_BEGINPASS_SWAPCHAIN_WGPU_EXPECT_DEPTHSTENCILVIEW,
    VALIDATE_BEGINPASS_SWAPCHAIN_WGPU_EXPECT_DEPTHSTENCILVIEW_NOTSET,
    VALIDATE_BEGINPASS_SWAPCHAIN_GL_EXPECT_FRAMEBUFFER_NOTSET,
    VALIDATE_APIP_PIPELINE_VALID_ID,
    VALIDATE_APIP_PIPELINE_EXISTS,
    VALIDATE_APIP_PIPELINE_VALID,
    VALIDATE_APIP_SHADER_EXISTS,
    VALIDATE_APIP_SHADER_VALID,
    VALIDATE_APIP_CURPASS_ATTACHMENTS_EXISTS,
    VALIDATE_APIP_CURPASS_ATTACHMENTS_VALID,
    VALIDATE_APIP_ATT_COUNT,
    VALIDATE_APIP_COLOR_FORMAT,
    VALIDATE_APIP_DEPTH_FORMAT,
    VALIDATE_APIP_SAMPLE_COUNT,
    VALIDATE_ABND_PIPELINE,
    VALIDATE_ABND_PIPELINE_EXISTS,
    VALIDATE_ABND_PIPELINE_VALID,
    VALIDATE_ABND_VBS,
    VALIDATE_ABND_VB_EXISTS,
    VALIDATE_ABND_VB_TYPE,
    VALIDATE_ABND_VB_OVERFLOW,
    VALIDATE_ABND_NO_IB,
    VALIDATE_ABND_IB,
    VALIDATE_ABND_IB_EXISTS,
    VALIDATE_ABND_IB_TYPE,
    VALIDATE_ABND_IB_OVERFLOW,
    VALIDATE_ABND_VS_EXPECTED_IMAGE_BINDING,
    VALIDATE_ABND_VS_IMG_EXISTS,
    VALIDATE_ABND_VS_IMAGE_TYPE_MISMATCH,
    VALIDATE_ABND_VS_IMAGE_MSAA,
    VALIDATE_ABND_VS_EXPECTED_FILTERABLE_IMAGE,
    VALIDATE_ABND_VS_EXPECTED_DEPTH_IMAGE,
    VALIDATE_ABND_VS_UNEXPECTED_IMAGE_BINDING,
    VALIDATE_ABND_VS_EXPECTED_SAMPLER_BINDING,
    VALIDATE_ABND_VS_UNEXPECTED_SAMPLER_COMPARE_NEVER,
    VALIDATE_ABND_VS_EXPECTED_SAMPLER_COMPARE_NEVER,
    VALIDATE_ABND_VS_EXPECTED_NONFILTERING_SAMPLER,
    VALIDATE_ABND_VS_UNEXPECTED_SAMPLER_BINDING,
    VALIDATE_ABND_VS_SMP_EXISTS,
    VALIDATE_ABND_FS_EXPECTED_IMAGE_BINDING,
    VALIDATE_ABND_FS_IMG_EXISTS,
    VALIDATE_ABND_FS_IMAGE_TYPE_MISMATCH,
    VALIDATE_ABND_FS_IMAGE_MSAA,
    VALIDATE_ABND_FS_EXPECTED_FILTERABLE_IMAGE,
    VALIDATE_ABND_FS_EXPECTED_DEPTH_IMAGE,
    VALIDATE_ABND_FS_UNEXPECTED_IMAGE_BINDING,
    VALIDATE_ABND_FS_EXPECTED_SAMPLER_BINDING,
    VALIDATE_ABND_FS_UNEXPECTED_SAMPLER_COMPARE_NEVER,
    VALIDATE_ABND_FS_EXPECTED_SAMPLER_COMPARE_NEVER,
    VALIDATE_ABND_FS_EXPECTED_NONFILTERING_SAMPLER,
    VALIDATE_ABND_FS_UNEXPECTED_SAMPLER_BINDING,
    VALIDATE_ABND_FS_SMP_EXISTS,
    VALIDATE_AUB_NO_PIPELINE,
    VALIDATE_AUB_NO_UB_AT_SLOT,
    VALIDATE_AUB_SIZE,
    VALIDATE_UPDATEBUF_USAGE,
    VALIDATE_UPDATEBUF_SIZE,
    VALIDATE_UPDATEBUF_ONCE,
    VALIDATE_UPDATEBUF_APPEND,
    VALIDATE_APPENDBUF_USAGE,
    VALIDATE_APPENDBUF_SIZE,
    VALIDATE_APPENDBUF_UPDATE,
    VALIDATE_UPDIMG_USAGE,
    VALIDATE_UPDIMG_ONCE,
    VALIDATION_FAILED,
}

Environment_Defaults :: struct
{
    color_format : Pixel_Format,
    depth_format : Pixel_Format,
    sample_count : i32,
}

Metal_Environment :: struct {
    device : rawptr,
}
D3d11_Environment :: struct {
    device : rawptr,
    device_context : rawptr,
}
Wgpu_Environment :: struct {
    device : rawptr,
}
Environment :: struct
{
    defaults : Environment_Defaults,
    metal : Metal_Environment,
    d3d11 : D3d11_Environment,
    wgpu : Wgpu_Environment,
}

Commit_Listener :: struct {
    func : proc "c" (a0: rawptr),
    user_data : rawptr,
}
Allocator :: struct {
    alloc_fn : proc "c" (a0: u64, a1: rawptr) -> rawptr,
    free_fn : proc "c" (a0: rawptr, a1: rawptr),
    user_data : rawptr,
}
Logger :: struct {
    func : proc "c" (a0: cstring, a1: u32, a2: u32, a3: cstring, a4: u32, a5: cstring, a6: rawptr),
    user_data : rawptr,
}

@(private)
Sokol_GFX_Desc :: struct
{
    _ : u32,
    buffer_pool_size : i32,
    image_pool_size : i32,
    sampler_pool_size : i32,
    shader_pool_size : i32,
    pipeline_pool_size : i32,
    attachments_pool_size : i32,
    uniform_buffer_size : i32,
    max_commit_listeners : i32,
    disable_validation : bool,
    mtl_force_managed_storage_mode : bool,
    mtl_use_command_buffer_with_retained_references : bool,
    wgpu_disable_bindgroups_cache : bool,
    wgpu_bindgroups_cache_size : i32,
    allocator : Allocator,
    logger : Logger,
    environment : Environment,
    _ : u32,
}

D3d11_Buffer_Info :: struct {
    buf : rawptr,
}
D3d11_Graphics_Image_Info :: struct {
    tex2d : rawptr,
    tex3d : rawptr,
    res : rawptr,
    srv : rawptr,
}
D3d11_Sampler_Info :: struct {
    smp : rawptr,
}
D3d11_Shader_Info :: struct {
    vs_cbufs : [4]rawptr,
    fs_cbufs : [4]rawptr,
    vs : rawptr,
    fs : rawptr,
}
D3d11_Pipeline_Info :: struct {
    il : rawptr,
    rs : rawptr,
    dss : rawptr,
    bs : rawptr,
}
D3d11_Attachments_Info :: struct {
    color_rtv : [4]rawptr,
    resolve_rtv : [4]rawptr,
    dsv : rawptr,
}
Mtl_Buffer_Info :: struct {
    buf : [2]rawptr,
    active_slot : i32,
}
Mtl_Graphics_Image_Info :: struct {
    tex : [2]rawptr,
    active_slot : i32,
}
Mtl_Sampler_Info :: struct {
    smp : rawptr,
}
Mtl_Shader_Info :: struct {
    vs_lib : rawptr,
    fs_lib : rawptr,
    vs_func : rawptr,
    fs_func : rawptr,
}
Mtl_Pipeline_Info :: struct {
    rps : rawptr,
    dss : rawptr,
}
Wgpu_Buffer_Info :: struct {
    buf : rawptr,
}
Wgpu_Graphics_Image_Info :: struct {
    tex : rawptr,
    view : rawptr,
}
Wgpu_Sampler_Info :: struct {
    smp : rawptr,
}
Wgpu_Shader_Info :: struct {
    vs_mod : rawptr,
    fs_mod : rawptr,
    bgl : rawptr,
}
Wgpu_Pipeline_Info :: struct {
    pip : rawptr,
}
Wgpu_Attachments_Info :: struct {
    color_view : [4]rawptr,
    resolve_view : [4]rawptr,
    ds_view : rawptr,
}
Gl_Buffer_Info :: struct {
    buf : [2]u32,
    active_slot : i32,
}
Gl_Graphics_Image_Info :: struct {
    tex : [2]u32,
    tex_target : u32,
    msaa_render_buffer : u32,
    active_slot : i32,
}
Gl_Sampler_Info :: struct {
    smp : u32,
}
Gl_Shader_Info :: struct {
    prog : u32,
}
Gl_Attachments_Info :: struct {
    framebuffer : u32,
    msaa_resolve_framebuffer : [4]u32,
}
