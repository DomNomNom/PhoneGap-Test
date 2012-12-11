/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */


var app = {
    initialize: function() {
        this.bind();
        $(document).ready(this.documentready)
        /*
        $("h1").click(function() {
          alert("Handler for .click() called.");
        });
        */
        //alert("handered was added")
    },
    bind: function() {
        document.addEventListener('deviceready', this.deviceready, false);
        /*
        document.addEventListener("touchstart", touchHandler, true);
        document.addEventListener("touchmove", touchHandler, true);
        document.addEventListener("touchend", touchHandler, true);
        document.addEventListener("touchcancel", touchHandler, true);
        */
    },
    documentready: function() {
        /*
        $(".draggable" ).draggable();
        $(".draggable" ).click(function() {
            alert("CLICK")
        });
        */


        // disable moving the screen
        //$('.app').preventUglyScroll();
        /*
        $(document).ready(function() {
          document.addEventListener('touchmove', function(e) { e.preventDefault(); }, false);
        });
        */
    },
    deviceready: function() {
        // This is an event handler function, which means the scope is the event.
        // So, we must explicitly called `app.report()` instead of `this.report()`.
        app.report('deviceready');
    },
    report: function(id) {
        // Report the event in the console
        console.log("Report: " + id);

        // Toggle the state from "pending" to "complete" for the reported ID.
        // Accomplished by adding .hide to the pending element and removing
        // .hide from the complete element.
        document.querySelector('#' + id + ' .pending').className += ' hide';
        var completeElem = document.querySelector('#' + id + ' .complete');
        completeElem.className = completeElem.className.split('hide').join('');
    }
};

/*
function touchHandler(event) {
    alert("touch handler")
    var touches = event.changedTouches,
    first = touches[0],
    type = "";
    switch(event.type) {
      case "touchstart": type="mousedown"; break;
      case "touchmove":  type="mousemove"; break;
      case "touchend":   type="mouseup"; break;
      default: return;
    }
    var simulatedEvent = document.createEvent("MouseEvent");
    simulatedEvent.initMouseEvent(type, true, true, window, 1,
                      first.screenX, first.screenY,
                      first.clientX, first.clientY, false,
                      false, false, false, 0, null);
    first.target.dispatchEvent(simulatedEvent);
    event.preventDefault();
}
*/

/*
// Prevent ugly scrolling on this element
(function($){
    $.fn.preventUglyScroll = function(){

        var node = this[0];

        node.ontouchstart = function(event) {
            touchStart = event;
            frameStart = $(node).offset().top;
        }

        node.ontouchmove = function(event){

            // block all two finger gestures
            if(event.touches.length > 1) {
                event.preventDefault();
                return false;
            }

            event.preventDefault();

            var yDiff     = event.pageY - touchStart.pageY;
            var newTop  = yDiff + frameStart;
            var hMin     = 460 - $(node).height();
            if(newTop <= 0 && newTop > hMin) {
                $(node).css('margin-top', newTop);
            }
        }
    }
})(jQuery);

*/