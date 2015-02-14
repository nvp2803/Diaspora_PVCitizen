module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    jshint: {
      all: ['Gruntfile.js', 'js/*.js']
    },
    jsonlint: {
      dev: {
        src: ['./*.json' ]
      }
    },
    sass: {
      dist: {
        files: {
          'css/normalize.css': 'scss/normalize.scss'
        }
      }
    }
  });

  // Load the plugin that provides the "uglify" task.
  grunt.loadNpmTasks('grunt-contrib');
  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-jsonlint');

  // Default task(s) .
  // grunt.registerTask('default', ['uglify']);
  grunt.registerTask('default', ['sass', 'jshint',  'jsonlint']);
  grunt.registerTask('lint', ['jshint', 'jsonlint']);
};