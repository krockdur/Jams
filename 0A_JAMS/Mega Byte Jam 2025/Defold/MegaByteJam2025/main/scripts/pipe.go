components {
  id: "pipe"
  component: "/main/scripts/pipe.script"
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"empty\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/assets/pipe_tilesource.tilesource\"\n"
  "}\n"
  ""
}
