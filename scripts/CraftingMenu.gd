extends CanvasLayer

var blocks: = 0;
@export_category("Doors")
@export var door: Array[Node];
@export var doorSlot: Array[Node];

# Called when the node enters the scene tree for the first time.
func _ready():
	blocks = 0;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var crafting: = Input.is_action_just_pressed("craft");
	var canCraft: = blocks >= 9;
	for i in doorSlot.size():
		var playerOnSlot: bool = doorSlot[i].isPlayerDetected();
		var doorLocked: bool = !door[i].getDoorState();

		var craftingAllowed = crafting and canCraft and doorLocked and playerOnSlot;

		# Handle Crafting.
		if craftingAllowed:
			blocks -= 9;
			door[i].enableDoor();
			reloadCounter();


func _on_blocks_block_broken():
	blocks += 1;
	reloadCounter();


func reloadCounter():
	$BlockCount/Counter.set_text(str(blocks));
