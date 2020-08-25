// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
import "bootstrap"
import "../../assets/stylesheets/application.scss"
import './bootstrap_custom.js'
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import CookiesEuBanner from "cookies-eu-banner"

document.addEventListener("turbolinks:load", () => {
	
var cookiesBanner = new CookiesEuBanner(function () {
    /* Example: your Google Analytics script */
    console.log("LOAD GA");
}, true);

// Prefer use addEventListener
// For demo purpose I will use the CookiesEuBanner internal method
// cookiesBanner.addClickListener(document.getElementById('custom-accept'), function () {
//   cookiesBanner.setConsent(true);
//   cookiesBanner.removeBanner();
//   updateCookiesEuState();
// });
// cookiesBanner.addClickListener(document.getElementById('custom-reject'), function () {
//   cookiesBanner.setConsent(false);
//   cookiesBanner.removeBanner();
//   updateCookiesEuState();
// });
// cookiesBanner.addClickListener(document.getElementById('custom-reset'), function () {
//   cookiesBanner.deleteCookie(cookiesBanner.cookieName);
//   window.location.reload();
// });
	
})

