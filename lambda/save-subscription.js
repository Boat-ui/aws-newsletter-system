const AWS = require('aws-sdk');
const dynamodb = new AWS.DynamoDB.DocumentClient();

exports.handler = async (event) => {
    console.log('Subscription request:', JSON.stringify(event));
    
    try {
        const body = JSON.parse(event.body);
        const email = body.email?.trim().toLowerCase();
        
        // Validate email
        if (!email || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
            return {
                statusCode: 400,
                headers: { 
                    'Content-Type': 'application/json',
                    'Access-Control-Allow-Origin': '*'
                },
                body: JSON.stringify({ error: 'Please provide a valid email address' })
            };
        }
        
        const params = {
            TableName: 'NewsletterSubscribers',
            Item: {
                email: email,
                subscribedAt: new Date().toISOString(),
                active: true,
                source: 'website'
            },
            ConditionExpression: 'attribute_not_exists(email)' // Prevent duplicates
        };
        
        await dynamodb.put(params).promise();
        
        return {
            statusCode: 200,
            headers: { 
                'Content-Type': 'application/json',
                'Access-Control-Allow-Origin': '*'
            },
            body: JSON.stringify({ 
                message: 'Successfully subscribed to the newsletter!',
                email: email
            })
        };
        
    } catch (error) {
        console.error('Error:', error);
        
        if (error.code === 'ConditionalCheckFailedException') {
            return {
                statusCode: 200,
                headers: { 'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*' },
                body: JSON.stringify({ message: 'Email already subscribed!' })
            };
        }
        
        return {
            statusCode: 500,
            headers: { 'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*' },
            body: JSON.stringify({ error: 'Internal server error' })
        };
    }
};
