'use strict'

exports.handler = function(event, context, callback) {
  var response = {
    statusCode: 200,
    headers: {
      'Content-Type': 'text/html; charset=utf-8'
    },
    body: '<p>They are eating her! And then they are going to eat me! Oh my GOOOOOOOOOOD! -Troll 2</p>'
  }
  callback(null, response)
}