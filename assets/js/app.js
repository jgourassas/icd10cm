// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
//import "../css/app.scss"
//import css from "../css/app.scss";
import $ from "jquery";
window.jQuery = $;
window.$ = $;


if ($("body")) {
  console.log("jquery works!");
}

  

import Foundation from 'foundation-sites';
$(document).foundation();

import css from "../css/app.scss"
//import "phoenix_html"
import {Interface_buttons} from "./external_injuries/draw_external.js";


export var App = {
  run: function() {
    Interface_buttons.draw_external_ini();
  }
};













