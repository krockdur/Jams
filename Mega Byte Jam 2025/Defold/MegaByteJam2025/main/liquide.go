components {
  id: "liquid_travel"
  component: "/main/liquid_travel.script"
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"square\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/main/test.atlas\"\n"
  "}\n"
  ""
}
embedded_components {
  id: "factory"
  type: "factory"
  data: "prototype: \"/main/liquide_block.go\"\n"
  ""
}
embedded_components {
  id: "spr_pixel"
  type: "sprite"
  data: "default_animation: \"pixel\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/main/test.atlas\"\n"
  "}\n"
  ""
}
