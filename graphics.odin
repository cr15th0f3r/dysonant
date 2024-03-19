package dysonant

import image_package "core:image"

Image :: image_package.Image

texture_create_from_image :: proc(type: Texture_Type, usage: Usage, image: ^Image) -> Texture
{
    desc: Sokol_GFX_Image_Desc
    desc.width = cast(i32)image.width
    desc.height = cast(i32)image.height
    desc.num_mipmaps = 1
    desc.num_slices = 1
    desc.sample_count = 1
    desc.usage = usage
    desc.data.subimage[0][0].ptr = raw_data(image.pixels.buf)
    desc.data.subimage[0][0].size = cast(u64)len(image.pixels.buf)
    
    switch image.depth
    {
        case 8:
            switch image.channels
            {
                case 1: desc.pixel_format = .R8UI
                case 2: desc.pixel_format = .RG8UI
                //case 3:
                case 4: desc.pixel_format = .RGBA8UI
            }
        case 16:
            switch image.channels
            {
                case 1: desc.pixel_format = .R16UI
                case 2: desc.pixel_format = .RG16UI
                //case 3:
                case 4: desc.pixel_format = .RGBA16UI
            }
    }

    return sg_make_image(desc)
}

Vertex_Buffer :: distinct u32

vertex_buffer_create :: proc {
    vertex_buffer_create_from_data,
    vertex_buffer_create_with_size,
}

vertex_buffer_create_from_data :: proc(data: []$T, usage: Usage = Usage.Immutable) -> Vertex_Buffer
{
    desc: Sokol_GFX_Buffer_Desc
    desc.type = .Vertex_Buffer
    desc.usage = usage
    desc.data.ptr = raw_data(data)
    desc.data.size = u64(len(data) * size_of(T))
    desc.size = desc.data.size
    return transmute(Vertex_Buffer)sg_make_buffer(desc)
}

vertex_buffer_create_with_size :: proc(size: uint, usage: Usage = Usage.Immutable) -> Vertex_Buffer
{
    desc: Sokol_GFX_Buffer_Desc
    desc.type = .Vertex_Buffer
    desc.usage = usage
    desc.size = u64(size)
    return transmute(Vertex_Buffer)sg_make_buffer(desc)
}

vertex_buffer_destroy :: #force_inline proc "contextless" (buffer: Vertex_Buffer)
{
    sg_destroy_buffer(transmute(Sokol_GFX_Buffer)buffer)
}

Index_Buffer :: distinct u32

index_buffer_create :: proc {
    index_buffer_create_from_slice,
    index_buffer_create_with_size,
}

index_buffer_create_from_slice :: proc(indices: []$T, usage: Usage = Usage.Immutable) -> Index_Buffer where T == u16 || T == u32
{
    desc: Sokol_GFX_Buffer_Desc
    desc.type = .Index_Buffer
    desc.usage = usage
    desc.data.ptr = raw_data(indices)
    desc.data.size = u64(len(indices) * size_of(T))
    desc.size = desc.data.size
    return transmute(Index_Buffer)sg_make_buffer(desc)
}

index_buffer_create_with_size :: proc(size: uint, usage: Usage = Usage.Immutable) -> Index_Buffer
{
    desc: Sokol_GFX_Buffer_Desc
    desc.type = .Index_Buffer
    desc.usage = usage
    desc.size = cast(u64)size
    return transmute(Index_Buffer)sg_make_buffer(desc)
}

index_buffer_destroy :: #force_inline proc "contextless" (buffer: Index_Buffer)
{
    sg_destroy_buffer(transmute(Sokol_GFX_Buffer)buffer)
}