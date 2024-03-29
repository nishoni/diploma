// To see this message, add the following to the `<head>` section in your
// views/layouts/application.html.erb
//
//    <%= vite_client_tag %>
//    <%= vite_javascript_tag 'application' %>
console.log('Vite ⚡️ Rails')

// If using a TypeScript entrypoint file:
//     <%= vite_typescript_tag 'application' %>
//
// If you want to use .jsx or .tsx, add the extension:
//     <%= vite_javascript_tag 'application.jsx' %>

console.log('Visit the guide for more information: ', 'https://vite-ruby.netlify.app/guide/rails')

// Example: Load Rails libraries in Vite.
//
// import * as Turbo from '@hotwired/turbo'
// Turbo.start()
//
// import ActiveStorage from '@rails/activestorage'
// ActiveStorage.start()
//
// // Import all channels.
// const channels = import.meta.globEager('./**/*_channel.js')

// Example: Import a stylesheet in app/frontend/index.css
// import '~/index.css'
import "./style.css"

import { createApp } from "vue";

import Main from "../components/Main.vue"
import Navbar from "../components/Navbar.vue"
import Sidebar from "../components/Sidebar.vue"
import MainPage from "../components/Main-Page.vue"
import History from "../components/History.vue"
import SearchSettings from "../components/Search-Settings.vue"
import DBSettings from "../components/DB-Settings.vue"
import SignIn from "../components/Sign-In.vue"
import SignUp from "../components/Sign-Up.vue"

const app = createApp(Main).mount("#main")
const navbar = createApp(Navbar).mount("#navbar")
const sidebar = createApp(Sidebar).mount("#sidebar")
const main_page = createApp(MainPage).mount("#mainpage")
const history = createApp(History).mount("#history")
const search_settings = createApp(SearchSettings).mount("#searchsettings")
const db_settings = createApp(DBSettings).mount("#dbsettings")
const sign_in = createApp(SignIn).mount("#signin")
const sign_up = createApp(SignUp).mount("#signup")
