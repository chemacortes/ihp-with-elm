ifneq ($(wildcard IHP/.*),)
IHP = IHP/lib/IHP
else
IHP = $(shell dirname $$(which RunDevServer))/../lib/IHP
endif

CSS_FILES += ${IHP}/static/vendor/bootstrap.min.css
CSS_FILES += ${IHP}/static/vendor/flatpickr.min.css
CSS_FILES += static/app.css

JS_FILES += ${IHP}/static/vendor/flatpickr.js
JS_FILES += ${IHP}/static/vendor/morphdom-umd.min.js
JS_FILES += ${IHP}/static/helpers.js
JS_FILES += static/elm/index.js

include ${IHP}/Makefile.dist

static/elm/index.js:
	NODE_ENV=production npm ci
	NODE_ENV=production npm run build