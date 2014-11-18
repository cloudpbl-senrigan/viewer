App.controller("TranslateController", ['switchImg', function(switchImg) {                                                                                                     
    this.flags = {
        forward: true,
        back: false,
        left: false,
        right: false
    };
    
    this.forward = function() {
        switchImg.switching(this.flags, "forward");
    };
    this.back = function() {
        switchImg.switching(this.flags, "back");
    };
    this.left = function() {
        switchImg.switching(this.flags, "left");
    };
    this.right = function() {
        switchImg.switching(this.flags, "right");
    };
}]);
