extends Node

# declare our variables
var currentLevel
var score = 0
var lives = 0

# initialize stuff here
func _ready():
	
	# first determine if a Saves directory exists.
	# if it doesn't, create it.
	var dir = Directory.new()
	if !dir.dir_exists("user://Saves"):
		dir.open("user://")
		dir.make_dir("user://Saves")

# the following functions are getters and setters for the variables

# get the current score
func get_score():
	return score

# set the score
func set_score(var amount):
	score += amount
	
# get the current lives
func get_lives():
	return lives

# set the lives
func set_lives(var amount):
	lives += amount

# get the current level name
func get_level():
	return get_tree().get_current_scene().get_filename()

# set the level
func set_level(var levelName):
	# currentLevel must be changed to the new level
	currentLevel = levelName
	get_tree().change_scene(levelName)

# the following functions save and load a game, depending on what the player does at the main/pause menus.
# at the end of each level, the save function is automatically called.

# first create a dictionary to store the save info in. Similar to a serializable class in Unity in which 
# the player data would be stored.
var GameData = {
	level="",
	score=0,
	lives=0
}

# this saves the current game state
func save_game_state(var saveName):
	
	# create a file object
	var saveGame = File.new()
	saveGame.open("user://Saves/"+saveName+".sve", File.WRITE)
	
	# create a data object to store the current save data in
	var data = GameData
	
	# store the data
	data.level = get_level()
	data.score = get_score()
	data.lives = get_lives()
	
	# write the data to disk
	saveGame.store_line(data.to_json())
	saveGame.close()

# this loads a previously saved game state
func load_game_state(var saveName):
	
	# create a file object
	var loadGame = File.new()
	
	# see if the file actually exists before opening it
	if !loadGame.file_exists("user://Saves/"+saveName+".sve"):
		print ("File not found! Aborting...")
		return
	
	# use an empty dictionary to assign temporary data to
	var currentLine = {}

	# read the data in
	loadGame.open("user://Saves/"+saveName+".sve", File.READ)
	while(!loadGame.eof_reached()):
		
		# use currentLine to parse through the file
		currentLine.parse_json(loadGame.get_line())
		
		# assign the data to the variables
		currentLevel  =  currentLine["level"]
		score = currentLine["score"]
		lives = currentLine["lives"]
	loadGame.close()
		
	
# this creates a new game altogether
func new_game():
	# intitalize default variables
	currentLevel = "res://start.scn"
	set_score(0)
	set_lives(3)
	set_level(currentLevel)
