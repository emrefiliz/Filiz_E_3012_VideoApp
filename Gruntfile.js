module.exports = function(grunt) {
  // 1. all config stuff goes here
  grunt.initConfig({
    pkg: grunt.file.readJSON("package.json"), // reads the packages etc inside that file
    uglify: {
      build: {
        src: "public/javascripts/main.js",
        dest: "public/javascripts/main.min.js"
      }
    },

    watch: {
      scripts: {
        files: ["public/javascripts/main.js"],
        tasks: ["uglify"],
        options: {
          spawn: false
        }
      },

      sass: {
        files: ["sass/*.scss"],
        tasks: ["sass"],
        options: {
          spawn: false
        }
      }
    },

    sass: {
      dist: {
        options: {
          style: "compressed"
        },
        files: {
          "public/stylesheets/main.css": "sass/main.scss",
          "public/stylesheets/kids.css": "sass/kids.scss"
        }
      }
    }
  });

  grunt.loadNpmTasks("grunt-contrib-uglify-es");
  grunt.loadNpmTasks("grunt-contrib-watch");
  grunt.loadNpmTasks("grunt-contrib-sass");

  grunt.registerTask("default", ["uglify", "sass"]);
  grunt.registerTask("watchFiles", ["watch"]);
};
