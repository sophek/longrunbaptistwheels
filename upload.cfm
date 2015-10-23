<!DOCTYPE html>

<meta charset="utf-8">

<title>Dropzone simple example</title>


<!--
  DO NOT SIMPLY COPY THOSE LINES. Download the JS and CSS files from the
  latest release (https://github.com/enyo/dropzone/releases/latest), and
  host them yourself!
-->
<script src="https://rawgit.com/enyo/dropzone/master/dist/dropzone.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<link rel="stylesheet" href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css">


<img src="images/faust-01.PNG" id="imgProduct23">
<img src="images/faust-01.PNG" id="imgProduct25">

<form id="my-dropzone" action="uploadme.cfm?imgID=23" class="dropzone" title="23"></form>

<form id="my-dropzone" action="uploadme.cfm?imgID=25" class="dropzone" title="25"></form>
<script>

    
Dropzone.options.myDropzone = {
      
  init: function() {
    this.on("complete", function(file) {
    d = new Date();
      //this.options.url = "/some-other-url";
        var imgId = this.element.title;
        var imgUrlId = "#imgProduct" + imgId;
        var imgUrl = imgId + ".jpg" + "?" + d.getTime(); 
        $(imgUrlId).attr("src",imgUrl);
        this.removeFile(file);
    });
  }
};  
    
    
//Dropzone.options.myDropzone = {
//        previewsContainer = "",
//        maxFiles: 2,
//        init: function() {
//            this.handleFiles = function(files) {
//                var file, _i, _len, _results;
//                _results = [];
//                for (_i = 0, _len = files.length; _i < _len; _i++) {
//                    file = files[_i];
//                    _results.push(this.addFile(file));
//                    // Make sure we don't handle more files than requested
//                    if (this.options.maxFiles != null && this.options.maxFiles > 0 && _i >= (this.options.maxFiles - 1)) {
//                        break;
//                    }
//                }
//                return _results;
//            };
//            this._addFilesFromItems = function(items) {
//                var entry, item, _i, _len, _results;
//                _results = [];
//                for (_i = 0, _len = items.length; _i < _len; _i++) {
//                    item = items[_i];
//                    if ((item.webkitGetAsEntry != null) && (entry = item.webkitGetAsEntry())) {
//                        if (entry.isFile) {
//                            _results.push(this.addFile(item.getAsFile()));
//                        } else if (entry.isDirectory) {
//                            _results.push(this._addFilesFromDirectory(entry, entry.name));
//                        } else {
//                            _results.push(void 0);
//                        }
//                    } else if (item.getAsFile != null) {
//                        if ((item.kind == null) || item.kind === "file") {
//                            _results.push(this.addFile(item.getAsFile()));
//                        } else {
//                            _results.push(void 0);
//                        }
//                    } else {
//                        _results.push(void 0);
//                    }
//                    // Make sure we don't handle more files than requested
//                    if (this.options.maxFiles != null && this.options.maxFiles > 0 && _i >= (this.options.maxFiles - 1)) {
//                        break;
//                    }
//                }
//                return _results;
//            };
//        }
//    };    
    
    
</script>

