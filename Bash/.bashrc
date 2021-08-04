# GIT

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
alias ls="~/ngrok http $1" 

# SCALA

# Create scala worksheet
function snw() { 
  echo "println(\"WorkSheet created!\")" >> $1.worksheet.sc 
}
# JAVASCRIPT

# Create fetch file
function nf() { 
  dir="libraries/fetch"
  mkdir -p $dir;
  echo -e "import fetch from 'node-fetch';\nconst BACKEND_API = process.env.NEXT_PUBLIC_BACKEND_API;\n\n// GETTING all API $1s\nexport const GET_users = (url, token) =>\n\tfetch(BACKEND_API + url, { headers: { auth: token } }).then((res) =>\n\t\tres.json()\n\t);\n\n// GETTING a API $1\nexport const GET_user = (url, token) =>\n\tfetch(BACKEND_API + url, { headers: { auth: token } }).then((res) =>\n\t\tres.json()\n\t);\n\n// CREATING a API $1\nexport const POST_user = (url, data) =>\n\tfetch(BACKEND_API + url, {\n\t\tmethod: 'POST',\n\t\tbody: JSON.stringify(data),\n\t\theaders: {\n\t\t\t'Content-Type': 'application/json',\n\t\t},\n\t}).then((res) => res.json());\n\n// UPDATING a API $1\nexport const PUT_user = (url, data, token) =>\n\tfetch(BACKEND_API + url, {\n\t\tmethod: 'PUT',\n\t\tbody: JSON.stringify(data),\n\t\theaders: {\n\t\t\t'Content-Type': 'application/json',\n\t\t\tauth: token,\n\t\t},\n\t}).then((res) => res.json());\n\n// DELETING a API $1\nexport const DELETE_user = (url, token) =>\n\tfetch(BACKEND_API + url, {\n\t\tmethod: 'DELETE',\n\t\theaders: { auth: token },\n\t}).then((res) => res.json());\n" >> $dir/$1.fetch.js;
}

# Create a Component file. JS and CSS
function nc() { 
  if [[ -z $2 ]]
  then
   dir="components"
  else
   dir="components/$2"
  fi
  mkdir -p $dir;
  echo -e "import style from './$1.module.css';\nfunction $1() {\n\treturn (\n\t\t<div className={style.$1}>\n\t\t\t<h2>$1</h2>\n\t\t</div>\n\t);\n}\nexport default $1;" >> $dir/$1.component.js ;
  echo -e "/* Phone RD */\n.$1 {\n\tfont-size: 2vh;\n\ttext-align: center;\n}\n\n/* Tablet RD */\n@media (min-width: 576px) {\n\t.$1 {\n\t\tbackground: var(--c01)\n;\t}\n}\n\n/* Laptop RD */\n@media (min-width: 768px) {\n\t.$1 {\n\t\tbackground: var(--c01)\n;\t}\n}\n\n/* Desktop RD */\n@media (min-width: 1200px) \n{\t.$1 {\n\t\tbackground: var(--c01)\n;\t}\n}" >> $dir/$1.module.css;  
}
# Create a Context file.
function nctx() {
  dir="context"
  mkdir -p $dir;
  echo -e "
import { createContext, useState } from 'react';
const _${1^}} = createContext();
export const _$1_ = ({ children }) => {
  const [$1, set$1] = useState(true);
  const toggle$1 = () => {
    set$1(!$1);
  };
  return (
    <_${1^}}.Provider value={{ $1, toggle$1 }}>
      {children}
    </_${1^}}.Provider>
  );
};
export default _${1^}};  
  " >> $dir/$1.context.js ;  
}

# Create a Next page with custom Head. JS and CSS
function np() { 
  nh $1;
  nc ${1^} $1
  nn $1;
  dir="pages"
  mkdir -p $dir;
  mkdir -p styles/$dir;
  mkdir -p components/$1;
  echo -e "import style from 'styles/pages/$1.module.css';\nimport Head from 'heads/${1^}.head';\nimport { Section, Body, Content } from 'components/timoideas/Timoideas.components';\nimport ${1^} from 'components/$1/${1^}.component';\nexport default function ${1^}() {\n\treturn (\n\t\t<>\n\t\t\t<Head />\n\t\t\t<Body>\n\t\t\t\t<Section>\n\t\t\t\t\t<Content center>\n\t\t\t\t\t\t<${1^} />\n\t\t\t\t\t</Content>\n\t\t\t\t</Section>\n\t\t\t</Body>\n\t\t</>\n\t);\n}" >> $dir/$1.js;
  echo -e "/* Phone RD */\n.$1 {\n\tfont-size: 2vh;\n\ttext-align: center;\n}\n\n/* Tablet RD */\n@media (min-width: 576px) {\n\t.$1 {\n\t\tbackground: var(--c01)\n;\t}\n}\n\n/* Laptop RD */\n@media (min-width: 768px) {\n\t.$1 {\n\t\tbackground: var(--c01)\n;\t}\n}\n\n/* Desktop RD */\n@media (min-width: 1200px) \n{\t.$1 {\n\t\tbackground: var(--c01)\n;\t}\n}" >> styles/$dir/$1.module.css;
}

# Create a Head Component
function nh() { 
  dir="heads"
  mkdir -p $dir;
  echo -e "import Head from 'next/head';\nexport default function Head_${1^}() {\n\treturn (\n\t\t<Head>\n\t\t\t<link rel='icon' href='icons/favicons/fav_main.ico' />\n\t\t\t<meta charSet='utf-8' />\n\t\t\t<meta name='viewport' content='initial-scale=1.0, width=device-width' />\n\t\t\t<meta name='mobile-web-app-capable' content='yes'></meta>\n\t\t\t<title>${1^} | Next</title>\n\t\t\t<meta\n\t\t\t\tname='description'\n\t\t\t\tcontent='${1^} page.'\n\t\t\t/>\n\t\t\t<meta property='og:image' content='images/og/og_main.png'></meta>\n\t\t</Head>\n\t);\n}" >> $dir/$1.head.js;
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
  echo -e "import { Router } from 'express';\nconst  = Router();\n\n// CONTROLLERS\nimport {\n\tGET_$1s,\n\tGET_$1,\n\tPOST_$1,\n\tPUT_$1,\n\tDELETE_$1,\n} from '../controllers/$1.controller';\n\n// MIDDLEWARES\n\n// -- Global Routes\n\nroutes.route('/').get(GET_$1s);\nroutes\n\t.route('/:id')\n\t.get(GET_$1)\n\t.post(POST_$1)\n\t.put(PUT_$1)\n\t.delete(DELETE_$1);\n\nexport default routes;\n" >> $dir/$1.routes.js;
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
