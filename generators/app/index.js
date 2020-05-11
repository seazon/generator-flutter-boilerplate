"use strict";
const Generator = require("yeoman-generator");
const mkdirp = require("mkdirp");
// Const chalk = require("chalk");
// Const yosay = require("yosay");

module.exports = class extends Generator {
  prompting() {
    // Have Yeoman greet the user.
    // This.log(yosay("Welcome to " + chalk.red("generator-flutter-boilerplat") + " generator!"));

    const prompts = [
      {
        name: "name",
        message: "What are you calling your app?",
        store: true,
        default: this.appname // Default to current folder name
      },
      {
        name: "package",
        message: "What package will you be publishing the app under?"
      }
    ];

    return this.prompt(prompts).then(props => {
      this.props = props;
      this.props.appPackage = props.package;
      this.appName = props.name;
      this.appPackage = props.package;
    });
  }

  writing() {
    // Var packageDir = this.props.appPackage.replace("/\./g", "/");

    mkdirp("android");
    // Mkdirp("android/app/src/main/kotlin/" + packageDir);
    mkdirp("ios");
    mkdirp("lib");
    mkdirp("test");

    var appPath = this.sourceRoot() + "/";

    this.fs.copy(appPath + "pubspec.lock", "pubspec.lock");
    this.fs.copy(appPath + "pubspec.yaml", "pubspec.yaml");
    this.fs.copy(appPath + "README.md", "README.md");

    this.fs.copy(appPath + "lib", "lib");
    this.fs.copy(appPath + "test", "test");
    this.fs.copy(appPath + "lib", "lib");
  }

  install() {
    this.installDependencies();
  }
};
