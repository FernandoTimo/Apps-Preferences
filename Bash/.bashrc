# GIT
# COLORES
ENDCOLOR="\e[0m"
BLACK="\e[0;30m"
_BLACK="\e[1;30m"
RED="\e[0;91m"
_RED="\e[1;91m"
GREEN="\e[0;32m"
_GREEN="\e[1;32m"
YELLOW="\e[0;93m"
_YELLOW="\e[1;93m"
BLUE="\e[0;34m"
_BLUE="\e[1;34m"
MAGENTA="\e[0;35m"
_MAGENTA="\e[1;35m"
CYAN="\e[0;36m"
_CYAN="\e[1;36m"
WHITE="\e[0;97m"
_WHITE="\e[1;97m"
GRAY="\e[0;90m"
_GRAY="\e[1;90m"

alias gb="code ~/.bashrc"
# Show file status
alias gs="git s"
# Add all files
alias ga="git a"
# Commit all changes
alias gc="git c"
# Add and Commit all changes
alias gac="git ac"
# Remove cache 
alias gcch="git cch"
# Open .gitconfig global file
alias gf="git file"
# Open .bashrc global file
alias bash="code ~/.bashrc" 
# Create a ngrok server
alias nls="~/ngrok http $1" 

# CONFIGURATION 

# Crea un vínculo fuerte de la configuración User a la configuración Global de vsCode
function lu() {
  rm -rf ~/AppData/Roaming/Code/User;
  cp -rl ~/Preferences/vsCode/User ~/AppData/Roaming/Code/;
}
# Crea un vínculo fuerte de la .gitconfig a la configuración Global de Git
function lg() {
  rm -rf ~/.gitconfig;
  cp -rl ~/Preferences/Git/.gitconfig ~/
}
# Crea un vínculo fuerte de la .bashrc a la configuración Global de Git Bash
function lb() {
  rm -rf ~/.bashrc;
  cp -rl ~/Preferences/Bash/.bashrc ~/
}
# Crea un vínculo fuerte de GitHub CLI a la configuración de cuentas de GitHub
function lgh() {
  # rm -rf ~/Preferences/GitHub/.github;
  cp -rl ~/Preferences/GH_CLI/"GitHub CLI" ~/AppData/Roaming/"GitHub CLI"/;
}

# SCALA
# Create scala worksheet
function snw() { 
  echo "println(\"WorkSheet created!\")" >> $1.worksheet.sc 
}
# JAVASCRIPT

# Create fetch file
function nf() { 
  if [[ -z $2 ]]
  then
   dir="libraries"
  else
   dir="libraries/$2"
  fi
  mkdir -p $dir;
  ext="fetch.js"
  echo -e "import fetch from 'node-fetch';\nconst BACKEND_API = process.env.NEXT_PUBLIC_BACKEND_API;\n\n// GETTING all API $1s\nexport const GET_$1s = (url, token) =>\n\tfetch(BACKEND_API + url, { headers: { auth: token } }).then((res) =>\n\t\tres.json()\n\t);\n\n// GETTING a API $1\nexport const GET_$1 = (url, token) =>\n\tfetch(BACKEND_API + url, { headers: { auth: token } }).then((res) =>\n\t\tres.json()\n\t);\n\n// CREATING a API $1\nexport const POST_$1 = (url, data) =>\n\tfetch(BACKEND_API + url, {\n\t\tmethod: 'POST',\n\t\tbody: JSON.stringify(data),\n\t\theaders: {\n\t\t\t'Content-Type': 'application/json',\n\t\t},\n\t}).then((res) => res.json());\n\n// UPDATING a API $1\nexport const PUT_$1 = (url, data, token) =>\n\tfetch(BACKEND_API + url, {\n\t\tmethod: 'PUT',\n\t\tbody: JSON.stringify(data),\n\t\theaders: {\n\t\t\t'Content-Type': 'application/json',\n\t\t\tauth: token,\n\t\t},\n\t}).then((res) => res.json());\n\n// DELETING a API $1\nexport const DEL_$1 = (url, token) =>\n\tfetch(BACKEND_API + url, {\n\t\tmethod: 'DELETE',\n\t\theaders: { auth: token },\n\t}).then((res) => res.json());\n" >> $dir/$1.$ext;
  code $dir/$1.$ext;
  ga $1 fetchers created.;
  echo -e "\n${_RED}--------/ ${_GRAY} Fetchers file created\n\n\t${CYAN}$dir/${_YELLOW}$1.$ext${ENDCOLOR}\n"
}

# Create a Component file. JS and CSS : nc ComponentName Location/Optional/FolderName
function nc() { 
  if [[ -z $2 ]]
  then
   dir="components"
  else
   dir="components/$2"
  fi
  component="${1^}"
  mkdir -p $dir;
  echo -e "import style from './$1.module.css';\nexport default function $1() {\n\treturn (\n\t\t<div className={style.Container}>\n\t\t\t<h2>$1</h2>\n\t\t</div>\n\t);\n}" >> $dir/$1.component.js ;
  echo -e "/* Phone */\n.Container {\n\tdisplay: flex;\n}\n\n/* Tablet */\n@media (min-width: 576px) {\n}\n/* Laptop */\n@media (min-width: 768px) {\n}\n/* Desktop */\n@media (min-width: 1200px) {\n}" >> $dir/$1.module.css;  
  code $dir/$1.component.js $dir/$1.module.css;
  ga $1 component created.;
  echo -e "\n${_RED}--------/ ${_GRAY} Component and Style files created\n\n\t${CYAN}$dir/${_YELLOW}$component.component.js\n\t${CYAN}$dir${GREY}/${_YELLOW}$component.module.css${ENDCOLOR}\n"

}

# Create a Context file.
function nctx() {
  dir="context"
  file="${1,,}"
  mkdir -p $dir;
  echo -e "import { createContext, useState } from 'react';\nconst _${1^} = createContext();\nexport const _${file^}_ = ({ children }) => {\n\tconst [$file, set$file] = useState(null);\n\tconst handler$file = (value) => {\n\t\tset$file(value);\n\t};\n\treturn (\n\t\t<_${1^}.Provider value={{ $file, handler$file }}>\n\t\t\t{children}\n\t\t</_${1^}.Provider>\n\t);\n};\nexport default _${1^};" >> $dir/$file.context.js ;
  code $dir/$file.context.js;
  echo -e "\n${_RED}--------/ ${_GRAY} Context file created\n\n\t${CYAN}$dir${GREY}/${_YELLOW}$file.context.js${ENDCOLOR}\n"
}

# Create a Next page with custom Head. JS and CSS
function np() {
  if [[ -z $2 ]]
  then
   dir="pages"
  else
   dir="pages/$2"
  fi
  page="${1,,}"
  mkdir -p $dir;
  mkdir -p styles/$dir;
  echo -e "import style from 'styles/$dir/$page.module.css';\nimport Head from 'heads/$page.head';\nimport { Section, Body, Content } from 'components/timoideas/Timoideas.components';\nexport default function Page() {\n\treturn (\n\t\t<>\n\t\t\t<Head />\n\t\t\t<Body>\n\t\t\t\t<Section>\n\t\t\t\t\t<Content center>\n\t\t\t\t\t\t<div className={style.Container}>${1^}</div>\n\t\t\t\t\t</Content>\n\t\t\t\t</Section>\n\t\t\t</Body>\n\t\t</>\n\t);\n}" >> $dir/$page.js;
  echo -e "/* Phone RD */\n.Container {\n\tdisplay: flex;\n}\n\n/* Tablet RD */\n@media (min-width: 576px) {\n\t.Container {\n\t\tbackground: var(--c01)\n;\t}\n}\n\n/* Laptop RD */\n@media (min-width: 768px) {\n\t.Container {\n\t\tbackground: var(--c01)\n;\t}\n}\n\n/* Desktop RD */\n@media (min-width: 1200px) \n{\t.Container {\n\t\tbackground: var(--c01)\n;\t}\n}" >> styles/$dir/$page.module.css;
  nh $page;
  code $dir/$page.js styles/$dir/$page.module.css;
  echo -e "\n${_RED}--------/ ${_GRAY} Page, Style and Head files created\n\n\t${CYAN}$dir/${_YELLOW}$page.js\n\t${CYAN}styles/$dir${GREY}/${_YELLOW}$page.module.css\n\t${CYAN}$head${GREY}/${_YELLOW}$page.head.js${ENDCOLOR}\n"
}

# Create a Head Component
function nh() { 
  head="heads"
  mkdir -p $head;
  echo -e "import Head from 'next/head';\nexport default function Head_${1^}() {\n\treturn (\n\t\t<Head>\n\t\t\t<link rel='icon' href='icons/favicons/fav_main.ico' />\n\t\t\t<meta charSet='utf-8' />\n\t\t\t<meta name='viewport' content='initial-scale=1.0, width=device-width' />\n\t\t\t<meta name='mobile-web-app-capable' content='yes'></meta>\n\t\t\t<title>${1^} | Next</title>\n\t\t\t<meta\n\t\t\t\tname='description'\n\t\t\t\tcontent='${1^} page.'\n\t\t\t/>\n\t\t\t<meta property='og:image' content='images/og/og_main.png'></meta>\n\t\t</Head>\n\t);\n}" >> $head/$1.head.js;
}

# Create a Hook Component
function nhk() { 
  dir="hooks"
  mkdir -p $dir;
  echo -e "import { useEffect } from 'react';\nexport default function $1({data}) {\n\treturn {data};\n}" >> $dir/$1.hook.js;
  code $dir/$1.hook.js ;
  echo -e "\n${_RED}--------/ ${_GRAY} Hook created\n\n\t${CYAN}$dir/${_YELLOW}$1.hook.js${ENDCOLOR}\n"
}

# Create a SWR Hook Component
function nswr() { 
  if [[ -z $2 ]]
  then
   dir="libraries/swr"
  else
   dir="libraries/swr/$2"
  fi
  mkdir -p $dir;
  echo -e "import useSWR from 'swr';\n\nexport default function $1() {\n\tconst { data } = useSWR('/api/${1,,}', () => ({}));\n\n\treturn { ...data };\n}" >> $dir/$1.swr.js;
  code $dir/$1.swr.js ;
  echo -e "\n${_RED}--------/ ${_GRAY} SWR Hook created\n\n\t${CYAN}$dir/${_YELLOW}$1.swr.js${ENDCOLOR}\n"
}

# Create a Redirect route config in Next.config.js
function nn() { 
  sed -i "/return \[/a \\\t\t\t{\n\t\t\t\tsource: '/${1^}',\n\t\t\t\tdestination: '/$1',\n\t\t\t\tpermanent: true,\n\t\t\t}," next.config.js
}

# Create a Mongoose Model
function nms() { 
  dir="src/models";
  mkdir -p $dir;
  echo -e "import { Schema, model } from 'mongoose';\nimport validator from 'mongoose-unique-validator';\nconst ${1^}Schema = new Schema({\n\t$1: { type: String },\n});\n${1^}Schema.plugin(validator, { message: 'El {PATH} debería ser único' });\nexport default model('${1^}', ${1^}Schema);\n" >> $dir/$1.schema.js;
}
# Create a router route
function nr() {
  dir="src/router";
  mkdir -p $dir;
  echo -e "import { Router } from 'express';\nconst routes = Router();\n\n// CONTROLLERS\nimport {\n\tGET_$1s,\n\tGET_$1,\n\tPOST_$1,\n\tPUT_$1,\n\tDEL_$1,\n} from '../controllers/$1.controller';\n\n// MIDDLEWARES\n\n// -- Global Routes\n\nroutes.route('/').get(GET_$1s);\nroutes\n\t.route('/:id')\n\t.get(GET_$1)\n\t.post(POST_$1)\n\t.put(PUT_$1)\n\t.delete(DEL_$1);\n\nexport default routes;\n" >> $dir/$1.routes.js;
  sed -i "/ROUTES/a import $1 from './$1.routes';\nroutes.use('/$1', $1);" src/router/index.routes.js
}
# Create a Controller CRUD
function nct() {
  dir="src/controllers";
  mkdir -p $dir;
  echo -e "import Validate from '../libraries/Validate';\nimport ${1^}Schema from '../models/$1.schema';\n\n// GETTING all DB $1s\nexport async function GET_$1s(req, res) {\n\ttry {\n\t\tconst $1s = await ${1^}Schema.find();\n\t\tres.status(200).json({ ok: true, data: $1s });\n\t} catch ({ message }) {\n\t\tres.status(200).json({ ok: false, message });\n\t}\n}\n\n// GETTING a DB $1\nexport async function GET_$1(req, res) {\n\ttry {\n\t\tconst { id } = req.params;\n\t\tconst $1 = await ${1^}Schema.findById(id);\n\t\tres.status(200).json({ ok: true, data: $1 });\n\t} catch ({ message }) {\n\t\tres.status(200).json({ ok: false, message });\n\t}\n}\n\n// CREATING a DB $1\nexport async function POST_$1(req, res) {\n\ttry {\n\t\tconst body = await Validate(req.body, ['$1']);\n\t\tconst $1 = new ${1^}Schema(body);\n\t\tconst _$1 = await $1.save();\n\t\tres.status(200).json({ ok: true, data: _$1 });\n\t} catch ({ message }) {\n\t\tres.status(200).json({ ok: false, message });\n\t}\n}\n\n// UPDATING a DB $1\nexport async function PUT_$1(req, res) {\n\ttry {\n\t\tconst { id } = req.params;\n\t\tconst body = await Validate(req.body, ['$1']);\n\t\tconst _$1 = await ${1^}Schema.findOneAndUpdate({ _id: id }, body, {\n\t\t\tnew: true,\n\t\t});\n\t\tres.status(200).json({ ok: true, data: _$1 });\n\t} catch ({ message }) {\n\t\tres.status(200).json({ ok: false, message });\n\t}\n}\n\n// DELETING a DB $1\nexport async function DEL_$1(req, res) {\n\tconst { id } = req.body;\n\t${1^}Schema.findByIdAndDelete(id, (err, data) => {\n\t\tif (err || !data) return res.status(200).json({ ok: false, incorrect: id });\n\t\tres.status(200).json({ ok: true, data });\n\t});\n}\n" >> $dir/$1.controller.js;
}
# Create a Full Backend CRUD
function ncb() {
  nms $1;
  nct $1;
  nr $1;
  ga init ${1^} CRUD
}
# Create a JSON file
function njson() {
  dir="public/json";
  mkdir -p $dir;
  echo -e "{\n\t\n}" >> $dir/$1.json;
}
# Create a SVG file
function nsvg() {
  dir="public/svg";
  mkdir -p $dir;
  echo -e "" >> $dir/$1.svg;
}
# Create a React Native Proyect
function nrn() {
  npx react-native init $1;
  mv $1 Phone;
  git clone https://github.com/FernandoTimo/Frontend-Native.git RN
  rm -rf RN/{.git,.gitignore}
  cp -R RN/. Phone
  rm -rf RN
  cd Phone;
  npx react-native link;
  npm i react-native-svg @react-navigation/native react-native-reanimated react-native-gesture-handler react-native-screens react-native-safe-area-context @react-native-community/masked-view @react-navigation/bottom-tabs;
  npm i react-native-svg-transformer -D;
}
# Create a React Native Component
function nnc() { 
  if [[ -z $2 ]]
  then
   dir="src/components"
  else
   dir="src/components/$2"
  fi
  mkdir -p $dir;
  echo -e "import {StyleSheet} from 'react-native';\n\nexport default StyleSheet.create({\n\t$1: {\n\t\tflex: 1,\n\t\tdisplay: 'flex',\n\t\tjustifyContent: 'center',\n\t\talignItems: 'center',\n\t},\n\tTitle: {\n\t\tfontFamily: 'T1',\n\t\tfontSize: 40,\n\t\tcolor: '#000',\n\t}\n});" >> $dir/$1.styles.js;  
  echo -e "import style from './$1.styles.js';\nimport React from 'react';\nimport {Text, View} from 'react-native';\nimport {Body} from './src/components/timoideas/Timoideas.component';\n\nexport default function $1() {\n\treturn (\n\t\t<Screen>\t\t\t<View style={style.$1}>\n\t\t\t\t<Text style={style.Title}>$1</Text>\n\t\t\t</View>\n\t\t</Screen>\n\t);\n}" >> $dir/$1.component.js ;
}
# Run Android Studio Emulator
function re() {
  cd ~/AppData/Local/Android/Sdk/emulator;
  ./emulator -avd Timoideas;
}
