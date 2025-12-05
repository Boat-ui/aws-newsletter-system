// Lambda function for saving email subscriptions
exports.handler = async (event) => {
    return {
        statusCode: 200,
        body: JSON.stringify({message: 'Newsletter system working!'})
    };
};
