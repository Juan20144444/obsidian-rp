[obsidian-rp-recipe.yaml](https://github.com/user-attachments/files/28390720/obsidian-rp-recipe.yaml)
$enginname: Obsidian Roleplay
version: 1.0.0
author: Juan20144444

tasks:

* action: download_github
  src: https://github.com/Juan20144444/obsidiana-rp
  ref: main
  dest: ./tmp/obsidian

* action: move_path
  src: ./tmp/obsidian/resources
  dest: ./resources

* action: move_path
  src: ./tmp/obsidian/server.cfg
  dest: ./server.cfg

* action: move_path
  src: ./tmp/obsidian/myLogo.png
  dest: ./myLogo.png

* action: connect_database

* action: write_file
  path: ./server.cfg
  append: true
  data: |

  # Obsidian Roleplay

  sets sv_projectName "Obsidian Roleplay"
  sets sv_projectDesc "Servidor oficial Obsidian RP"

  setr UseTarget false

  ensure [obsidian]

