console.log('Here we go!')

const AWS = require('aws-sdk')
const docClient = new AWS.DynamoDB.DocumentClient({region: 'eu-west-1'})

exports.handler = function(event, context, callback){
    console.log('processing event: ' + JSON.stringify(event, null, 2))

    let currentMonth = new Date().getMonth() + 1 
    let currentYear = new Date().getFullYear()

    let params =  {
        Item: {
            Date: Date.now(),
            Author: event.author ? event.author : "Anonymous",
            Tip: event.tip,
            Category: event.category,
            MonthAttribute: currentMonth,
            YearAttribute: currentYear,
            YearMonthAttribute: currentYear + "-" + currentMonth
        },

        TableName: 'CodingTips'
    };

    docClient.put(params, function(err,data){
        if(err) {
            callback(err, null)
        }else{
            callback(null, data)
        }
    });

}