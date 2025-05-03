const gulp = require('gulp');
const cleanCSS = require('gulp-clean-css');
const autoprefixer = require('gulp-autoprefixer');

// Minify and autoprefix CSS
gulp.task('styles', function () {
  return gulp.src('./assets/css/*.css')
    .pipe(autoprefixer())
    .pipe(cleanCSS())
    .pipe(gulp.dest('./assets/css/min'));
});

// Default task
gulp.task('default', gulp.series('styles'));
