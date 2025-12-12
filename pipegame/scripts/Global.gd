extends Node

var NB_TILE_X = 15
var NB_TILE_Y = 10

var HORIZONTAL_FLAT_PIPE = 	{ "name": "HORIZONTAL_FLAT_PIPE", 	"tile": Vector2i(0, 0), "alternative_tile": 0 }
var CROSS_PIPE = 			{ "name": "CROSS_PIPE", 			"tile": Vector2i(0, 1), "alternative_tile": 0 }
var VERTICAL_FLAT_PIPE = 	{ "name": "VERTICAL_FLAT_PIPE", 	"tile": Vector2i(0, 2), "alternative_tile": 0 }
var CORNER_TOP_RIGHT_PIPE = { "name": "CORNER_TOP_RIGHT_PIPE", 	"tile": Vector2i(0, 3), "alternative_tile": 0 }
var CORNER_TOP_LEFT_PIPE = 	{ "name": "CORNER_TOP_LEFT_PIPE", 	"tile": Vector2i(0, 4), "alternative_tile": 0 }
var CORNER_BOT_RIGHT_PIPE = { "name": "CORNER_BOT_RIGHT_PIPE", 	"tile": Vector2i(0, 3), "alternative_tile": 2 }
var CORNER_BOT_LEFT_PIPE = 	{ "name": "CORNER_BOT_LEFT_PIPE", 	"tile": Vector2i(0, 4), "alternative_tile": 3 }
var STARTER_TO_BOT_PIPE = 	{ "name": "STARTER_TO_BOT_PIPE", 	"tile": Vector2i(0, 6), "alternative_tile": 0 }
var STARTER_TO_TOP_PIPE = 	{ "name": "STARTER_TO_TOP_PIPE", 	"tile": Vector2i(0, 6), "alternative_tile": 1 }
var STARTER_TO_LEFT_PIPE = 	{ "name": "STARTER_TO_LEFT_PIPE", 	"tile": Vector2i(0, 6), "alternative_tile": 3 }
var STARTER_TO_RIGHT_PIPE = { "name": "STARTER_TO_RIGHT_PIPE", 	"tile": Vector2i(0, 6), "alternative_tile": 2 }
var EMPTY_PIPE = 			{ "name": "EMPTY_PIPE", 			"tile": Vector2i(0, 5), "alternative_tile": 0 }
