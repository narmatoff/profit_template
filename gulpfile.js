"use strict";
////////////////////////////////////////vars
var gulp = require('gulp'),
    // less = require('gulp-less'),
    // concatCss = require('gulp-concat-css'),
    // minifyCss = require('gulp-minify-css'),
    rename = require("gulp-rename"),
    autoprefixer = require('gulp-autoprefixer'),
    livereload = require('gulp-livereload'),
    notify = require("gulp-notify"),
    path = require('path'),
    // uncss = require('gulp-uncss'),
    concat = require('gulp-concat'),
    // LessPluginCleanCSS = require('less-plugin-clean-css'),
    // cleancss = new LessPluginCleanCSS({
    //     advanced: true
    // }),
    // LessPluginAutoPrefix = require('less-plugin-autoprefix'),
    // autoprefix = new LessPluginAutoPrefix({
    //     browsers: ["last 14 versions"]
    // }),
    jade = require('gulp-jade'),
    // coffee = require('gulp-coffee'),
    connect = require('gulp-connect'),
    gutil = require('gulp-util'),
    // coffeeStream = coffee({
    //     bare: true
    // }),
    imagemin = require('gulp-imagemin'),
    image = require('gulp-image'),
    pngquant = require('imagemin-pngquant'),
    csso = require('gulp-csso'),
    merge = require('gulp-merge'),
    svgmin = require('gulp-svgmin'),
    spritesmith = require('gulp.spritesmith'),
    plumber = require('gulp-plumber'),
    sass = require('gulp-sass'),
    jshint = require('gulp-jshint'),
    jsmin = require('gulp-jsmin'),
    sourcemaps = require('gulp-sourcemaps'),
    // svgSprite = require("gulp-svg-sprites"),
    wiredep = require('wiredep').stream,
    combineMq = require('gulp-combine-mq'),
    size = require('gulp-filesize'),
    changed = require('gulp-changed'),
    gulp = require('gulp');


// gulp.task('html', function () {
//     return gulp.src('app/*.html')
//         .pipe(useref())
//         .pipe(gulpif('*.js'))
//         .pipe(gulpif('*.css'))
//         .pipe(gulp.dest('dist'));
// });



// jade
gulp.task('jade', function() {
    var YOUR_LOCALS = {};
    gulp.src('src/jade/*.jade')
        .pipe(changed('dist/'))
        // .pipe(plumber())
        .pipe(plumber({ errorHandler: notify.onError("Error: <%= error.message %>") }))
        .pipe(jade({
            locals: YOUR_LOCALS,
            pretty: true,
            paths: [path.join(__dirname, 'src/jade/includes')]
        }).on('error', gutil.log))
        .pipe(connect.reload())
        .pipe(livereload())
        .pipe(gulp.dest('dist/'));
        // .pipe(notify("jade готов!"));
});

// fonts
gulp.task('fonts', function() {
    return gulp.src([
            'src/fonts/*.*'
        ])
        // .pipe(changed('dist/css/fonts'))
        .pipe(plumber({ errorHandler: notify.onError("Error: <%= error.message %>") }))
        // .pipe(notify("fonts Done!"))
        .pipe(gulp.dest('dist/css/fonts'));
});


// css
// gulp.task('css', function() {
//     // gulp.src('dist/css/bundle.min.css')
//     gulp.src('src/css/noncompld/*.css')
//         .pipe(plumber())
//         .pipe(minifyCss({
//             compatibility: 'ie8'
//         }))
//     .pipe(autoprefixer({
//             browsers: ['last 14 versions'],
//             cascade: false
//         }))
//         //
//         // "delete unuseble selectors from scc file"
//         // .pipe(uncss({
//         //     html: ['dist/*.html']
//         // }))
//         // .pipe(cmq({
//         //     log: true
//         // })) // проверить работоспособность!
//         .pipe(rename('main.css'))
//         .pipe(gulp.dest('dist/css'))
//         .pipe(livereload())
//         .pipe(notify("Css готов!"));
// });
gulp.task('lint_mainjs', function() {
    return gulp.src('src/js_src/*.js')
        .pipe(changed('dist/js'))
        .pipe(size())
        .pipe(concat('all.js'))
        // .pipe(plumber())
        .pipe(plumber({ errorHandler: notify.onError("Error: <%= error.message %>") }))
        .pipe(jshint())
        .pipe(jshint.reporter('fail'))
        .pipe(connect.reload())
        .pipe(livereload())
        .pipe(jsmin())
        .pipe(rename({
            suffix: '.min'
        }))
        .pipe(gulp.dest('dist/js'))
        .pipe(size());
        // .pipe(notify("js готов!"));
});
// gulp.task('lint_mainjs', function() {
//     return gulp.src('src/js_src/paceoptions.js')
//         .pipe(plumber())
//         .pipe(jshint())
//         .pipe(jshint.reporter('fail'))
//         .pipe(connect.reload())
//         .pipe(livereload())
//         .pipe(jsmin())
//         .pipe(rename({
//             suffix: '.min'
//         }))
//         .pipe(gulp.dest('dist/js'));
//     // .pipe(notify("js готов!"));
// });
// gulp.task('lint_customplgnsjs', function() {
//     return gulp.src('src/js_src/custom_plgns.js')
//         .pipe(plumber())
//         // .pipe(jshint())
//         // .pipe(jshint.reporter('fail'))
//         .pipe(connect.reload())
//         .pipe(livereload())
//         .pipe(jsmin())
//         .pipe(rename({
//             suffix: '.min'
//         }))
//         .pipe(gulp.dest('dist/js'));
//     // .pipe(notify("js готов!"));
// });
// sass
gulp.task('sass', function() {
    gulp.src('src/sass/main.scss')
        .pipe(changed('dist/css'))

    .pipe(plumber({ errorHandler: notify.onError("Error: <%= error.message %>") }))
        .pipe(size())
        // .pipe(plumber())
        // .pipe(sourcemaps.init())
        .pipe(sass({
            // paths: [path.join(__dirname, 'src/sass/includes')],
            includePaths: ['.'],
            outputStyle: 'compressed'
                // outputStyle: 'expanded'
        }).on('error', sass.logError))
        .pipe(rename('main.css'))
        .pipe(autoprefixer({
            browsers: ['last 14 versions'],
            cascade: false
        }))
        // компановка медиа запросов
        .pipe(combineMq({
            beautify: false
        }))
        .pipe(csso())
        // .pipe(uncss({
        //     html: ['dist/*.html']
        // }))
        .pipe(sourcemaps.write('maps'))
        .pipe(gulp.dest('dist/css'))
        .pipe(size())
        .pipe(connect.reload())
        .pipe(livereload());
        // .pipe(notify("sass готов!"));
});
// спрайты
gulp.task('sprite', function() {
    // Generate our spritesheet
    var spriteData = gulp.src('src/images/forsprts/*.png')
        .pipe(changed('dist/img'))

    // .pipe(plumber())
    .pipe(plumber({ errorHandler: notify.onError("Error: <%= error.message %>") }))
        .pipe(spritesmith({
            imgName: 'sprite.png',
            imgPath: "/dist/img/sprite.png",
            cssName: '_sprite.scss',
            cssFormat: "scss",
            // padding: "2",

            // top-down left-right  diagonal    alt-diagonal    binary-tree
            algorithm: "top-down"
        }));
    // Pipe image stream through image optimizer and onto disk
    var imgStream = spriteData.img
        // .pipe(imagemin())
        .pipe(gulp.dest('dist/img'));
    // Pipe CSS stream through CSS optimizer and onto disk
    var cssStream = spriteData.css
        // .pipe(csso())
        .pipe(gulp.dest('src/sass'))
        .pipe(size());
    // Return a merged stream to handle both `end` events
    return merge(imgStream, cssStream)
        .pipe(connect.reload())
        .pipe(livereload());
        // .pipe(notify("sprite готов!"));
});
// svgsprites
// gulp.task('svgsprites', function() {
//     return gulp.src('src/images/forsvgsprts/*.svg')
//         .pipe(svgSprite({
//             cssFile: "src/sass/_svgsprite.scss",
//             sprite: "svgsprite.svg"
//         }))
//         .pipe(gulp.dest("dist/img/svg"))
//         .pipe(connect.reload())
//         .pipe(livereload());
// });
// imagemin
gulp.task('imagemin', function() {
    return gulp.src('src/images/*')
        .pipe(changed('dist/img'))
        .pipe(size())
        // .pipe(plumber())
        .pipe(plumber({ errorHandler: notify.onError("Error: <%= error.message %>") }))
        .pipe(imagemin({
            progressive: true,
            svgoPlugins: [{ removeViewBox: true }],
            use: [pngquant()]
        }))
        .pipe(gulp.dest('dist/img'))
        .pipe(size())
        .pipe(connect.reload())
        .pipe(livereload());
        // .pipe(notify("imagemin готов!"));
});

// image
gulp.task('image', function() {
    // gulp.src('src/images/*')
    // смотреть все подряд
    gulp.src('src/images/**/*')
        .pipe(changed('dist/img'))

    .pipe(size())
        // .pipe(plumber())
        .pipe(plumber({ errorHandler: notify.onError("Error: <%= error.message %>") }))
        .pipe(image({
            pngquant: true,
            optipng: true,
            zopflipng: true,
            advpng: true,
            jpegRecompress: false,
            jpegoptim: true,
            mozjpeg: true,
            gifsicle: true,
            svgo: true
        }))
        .pipe(gulp.dest('dist/img'))
        .pipe(size())
        .pipe(connect.reload())
        .pipe(livereload());
        // .pipe(notify("image done"));
});

// svgmin
gulp.task('svgmin', function() {
    return gulp.src('src/images/svg/**/*.svg')
        .pipe(changed('dist/img/svg'))

    .pipe(size())
        // .pipe(plumber())
        .pipe(plumber({ errorHandler: notify.onError("Error: <%= error.message %>") }))
        .pipe(svgmin({
            js2svg: {
                pretty: true
            },
            plugins: [{
                removeDoctype: true
            }, {
                removeComments: true
            }]
        }).on('error', gutil.log))
        .pipe(gulp.dest('dist/img/svg'))
        .pipe(size());
        // .pipe(notify("svgmin готов!"));
});
// bower
gulp.task('bower', function() {
    return gulp
        .src('src/jade/**/*.jade')

    .pipe(plumber({ errorHandler: notify.onError("Error: <%= error.message %>") }))
        .pipe(wiredep({
            directory: "dist/components/",
            // игнорируем путь для относительности путей(если стили и библиотеки не подключились)
            ignorePath: '../../dist/'
        }).on('error', gutil.log))
        .pipe(gulp.dest('src/jade/'))
        .pipe(connect.reload())
        .pipe(livereload());
        // .pipe(notify("bower готов!"));
});

// connect
gulp.task('connect', function() {
    connect.server({
        livereload: true,
        host: '0.0.0.0'
    });
});
// less
// gulp.task('less', function() {
//     return gulp
//         .src('src/less/main.less')
//         .pipe(plumber())
//         .pipe(less({
//             paths: [path.join(__dirname, 'src/less/includes')]
//         }).on('error', gutil.log))
//         .pipe(less({
//             plugins: [cleancss, autoprefix]
//         }))
//         .pipe(rename('bundle.min.css'))
//         .pipe(connect.reload())
//         .pipe(livereload())
//         .pipe(gulp.dest('dist/css'))
//         .pipe(notify("less готов!"));
// });
// coffee
// gulp.task('coffee', function() {
//     gulp.src('src/coffee/*.coffee')
// .pipe(plumber())
//         .pipe(coffee({
//             bare: true
//         }).on('error', gutil.log))
//         .pipe(connect.reload())
//         .pipe(livereload())
//         .pipe(gulp.dest('dist/js'))
//         .pipe(notify("coffee готов!"));
// });
// html
// gulp.task('html', function() {
//     gulp.src('*.html')
//         .pipe(connect.reload())
//         .pipe(livereload())
//         .pipe(notify("html готов!"));
// });
// strip
// gulp.task('strip', function() {
//     gulp.src('dist/js/*.js')
//         .pipe(strip())
//         .pipe(gulp.dest('dist/js'));
// });
// Watch
gulp.task('watch', function() {
    gulp.watch('src/images/forsprts/**/*.png', ['sprite']);
    gulp.watch('bower.json', ['bower']);
    gulp.watch('src/jade/**/*.jade', ['jade']);
    // gulp.watch('src/css/noncompld/*.css', ['css']);
    gulp.watch('src/sass/**/*.scss', ['sass']);
    gulp.watch('src/fonts/**/*.*', ['fonts']);
    gulp.watch('src/js_src/*.js', ['lint_mainjs']);
    // gulp.watch('src/js_src/paceoptions.js', ['lint_mainjs']);
    // gulp.watch('src/js_src/custom_plgns.js', ['lint_customplgnsjs']);
    gulp.watch('src/images/master_picture.png', ['favicons']);
    // gulp.watch('src/images/master_picture.png', ['inject-favicon-markups']);
    // gulp.watch('src/images/forsvgsprts/*.svg', ['svgsprites']);
    gulp.watch('src/images/*', ['imagemin']);
    gulp.watch('src/images/svg/*', ['svgmin']);
    // gulp.watch('src/less/**/*.less', ['less']);
    // gulp.watch('src/coffee/*.coffee', ['coffee']);
    livereload.listen();
});
// default
gulp.task('default', ['jade', 'sprite', 'fonts', 'sass', 'bower', 'lint_mainjs', 'image', 'svgmin', 'watch', 'connect']);
