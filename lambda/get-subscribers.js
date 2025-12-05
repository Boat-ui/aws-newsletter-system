const AWS = require('aws-sdk');
const dynamodb = new AWS.DynamoDB.DocumentClient();

exports.handler = async (event) => {
    console.log('Get subscribers request:', JSON.stringify(event));
    
    // Check admin token
    const token = event.queryStringParameters?.token || 
                  event.headers['x-admin-token'] ||
                  event.headers['Authorization']?.replace('Bearer ', '');
    
    if (token !== 'TravelAdmin123') {
        return {
            statusCode: 401,
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ error: 'Unauthorized: Invalid admin token' })
        };
    }
    
    try {
        const params = {
            TableName: 'NewsletterSubscribers',
            Limit: 100
        };
        
        const data = await dynamodb.scan(params).promise();
        
        // Sort by date descending
        const subscribers = data.Items.sort((a, b) => 
            new Date(b.subscribedAt) - new Date(a.subscribedAt)
        );
        
        return {
            statusCode: 200,
            headers: { 
                'Content-Type': 'application/json',
                'Access-Control-Allow-Origin': '*'
            },
            body: JSON.stringify(subscribers)
        };
        
    } catch (error) {
        console.error('Error:', error);
        return {
            statusCode: 500,
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ error: error.message })
        };
    }
};
