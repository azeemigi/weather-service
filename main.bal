import ballerina/http;
import ballerina/os;

service / on new http:Listener(9090) {

    resource function get weather(http:Request req, string city) returns json|error {

        string apiKey = os:getEnv("WEATHER_API_KEY");
        string apiUrl = "http://api.openweathermap.org/data/2.5/weather?q=" + city + "&appid=" + apiKey;

        http:Client httpClient = check new (apiUrl);
        json payload = <json> check httpClient -> get("/", targetType = json);

        return payload;
    }
}

