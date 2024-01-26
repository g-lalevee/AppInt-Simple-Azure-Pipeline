"use strict";

const apickli = require('../../../apickli/apickli.js');
const {Before, setDefaultTimeout} = require('@cucumber/cucumber');

setDefaultTimeout(10 * 1000); // this is in ms

Before(function () {
  const host = "hostname";
  const basePath = "api_basepath";
  const baseUri = `${host}${basePath}`;
  console.log(`Test Base URI: ${baseUri}`);
  this.apickli = new apickli.Apickli("https", baseUri);
  this.apickli.addRequestHeader("Cache-Control", "no-cache");
});