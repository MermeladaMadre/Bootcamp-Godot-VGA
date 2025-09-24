extends Node

var globalScore:int = 0
var contadorPresionados:int = 0
var record = 0
const SAVE_PATH := "user://score.init"

# Guarda el record en un archivo
func save_record():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		file.store_var(record) # Guarda el valor
		file.close()
		print("Record guardado:", record)
	else:
		print("Error al guardar el Record")

# Carga el record desde el archivo
func load_record():
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		if file:
			record = file.get_var() # Lee el valor
			file.close()
			print("Record cargado:", record)
		else:
			print("Error al leer el Record")
	else:
		print("No existe archivo de guardado, record = 0")
		record = 0
