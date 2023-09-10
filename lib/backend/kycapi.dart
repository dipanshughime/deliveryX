
import 'dart:convert';


import 'package:http/http.dart' as http;



// Future<String> getApiKey() async {
//   print("Loading API_KEY from .env...");
//   await dotenv.load(fileName: ".env");
//   print("API_KEY loaded: ${dotenv.env['API_KEY'] ?? 'Not found'}");
//   return dotenv.env['API_KEY'] ?? "";
// }

// Future<String> getAccountId() async {
//   print("Loading ACCOUNT_ID from .env...");
//   await dotenv.load(fileName: ".env");
//   print("ACCOUNT_ID loaded: ${dotenv.env['ACCOUNT_ID'] ?? 'Not found'}");
//   return dotenv.env['ACCOUNT_ID'] ?? "";
// }

Future<String?> verifyAadhar(String? aadharNumber) async {
String apiKey = "7ace2ee9-59cb-4244-b1dd-fb2fef0af175";
String accountId = "8d1eb1c40dcb/4bc33de8-78e0-473a-9c63-024c84562e75";


  print(apiKey);
  final url = 'https://eve.idfy.com/v3/tasks/async/verify_with_source/aadhaar_lite';
  final response = await http.post(
    Uri.parse(url),
    headers: {
      'api-key': apiKey,
      'account-id': accountId,
      'Content-Type': 'application/json',
    },
    body: '''
    {
      "task_id": "74f4c926-250c-43ca-9c53-453e87ceacd1",
      "group_id": "8e16424a-58fc-4ba4-ab20-5bc8e7c3c41e",
      "data": {
        "aadhaar_number": "$aadharNumber"
      }
    }
    ''',
  );

 if (response.statusCode == 202) {
    final jsonResponse = json.decode(response.body); // Parse the JSON response
    final request_id = jsonResponse['request_id']; 
     final getResult = await getVerificationResult(request_id);
    print('Aadhar verification result: $getResult');

     if (getResult != null) {
  Map<String, dynamic> parsedJson = json.decode(getResult);
  
  String? status = parsedJson['status'];
  print(status);
  return status;
  

}

    
    
    
  } else {
    // Handle the API error here
    print('Aadhar verification failed. Status Code: ${response.statusCode}');
   
  }
  
  
}

Future<String?> getVerificationResult(String? request_id) async {
  final headers = {
    'api-key': '7ace2ee9-59cb-4244-b1dd-fb2fef0af175',
    'account-id': '8d1eb1c40dcb/4bc33de8-78e0-473a-9c63-024c84562e75',
  };

  String? verificationResult;
  bool completed = false;

  while (!completed) {
    final url = 'https://eve.idfy.com/v3/tasks?request_id=$request_id';
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.statusCode);

   if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final status = jsonResponse[0]['status'];

      if (status == 'completed') {
        // Verification is completed, store the result and exit the loop
        verificationResult = json.encode(jsonResponse[0]);
        completed = true;
      } else if(status == 'failed') {
         print('Verification failed. Response Body: ${response.body}');
      break; 
        } else {
      // Verification is still in progress, wait for a while before polling again
      await Future.delayed(Duration(seconds: 5)); // Adjust the delay as needed
    }
    } else {
      // Handle the API error here
      print('Failed to fetch verification result. Status Code: ${response.statusCode}');
      print('Reason: ${response.reasonPhrase}');
      return null;
    }
  }

  return verificationResult;
}



Future<String?> verifyPan(String? panNumber) async {
String apiKey = "7ace2ee9-59cb-4244-b1dd-fb2fef0af175";
String accountId = "8d1eb1c40dcb/4bc33de8-78e0-473a-9c63-024c84562e75";


  print(apiKey);
  final url = 'https://eve.idfy.com/v3/tasks/async/verify_with_source/ind_pan_plus';
  final response = await http.post(
    Uri.parse(url),
    headers: {
      'api-key': apiKey,
      'account-id': accountId,
      'Content-Type': 'application/json',
    },
    body: '''
    {
      "task_id": "74f4c926-250c-43ca-9c53-453e87ceacd1",
      "group_id": "8e16424a-58fc-4ba4-ab20-5bc8e7c3c41e",
      "data": {
        "id_number": "$panNumber"
      }
    }
    ''',
  );

 if (response.statusCode == 202) {
    final jsonResponse = json.decode(response.body); // Parse the JSON response
    final request_id = jsonResponse['request_id']; 
    print('Request_id: $request_id');
     final getResult = await getVerificationResultPan(request_id);
    print('Pan verification result: $getResult');

    if (getResult != null) {
  Map<String, dynamic> parsedJson = json.decode(getResult);
  
   String? fullName = parsedJson["result"]["source_output"]["full_name"];
   return fullName;

}



    
    
    
  } else {
    // Handle the API error here
    print('Aadhar verification failed. Status Code: ${response.statusCode}');
   
  }

  
}

Future<String?> getVerificationResultPan(String request_id) async {
  final headers = {
    'api-key': '7ace2ee9-59cb-4244-b1dd-fb2fef0af175',
    'account-id': '8d1eb1c40dcb/4bc33de8-78e0-473a-9c63-024c84562e75',
  };

  String? verificationResult;
  bool completed = false;

  while (!completed) {
    final url = 'https://eve.idfy.com/v3/tasks?request_id=$request_id';
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.statusCode);

   if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final status = jsonResponse[0]['status'];

      if (status == 'completed') {
        // Verification is completed, store the result and exit the loop
        verificationResult = json.encode(jsonResponse[0]);
        completed = true;
      } else if(status == 'failed') {
         print('Verification failed. Response Body: ${response.body}');
      break; 
        } else {
      // Verification is still in progress, wait for a while before polling again
      await Future.delayed(Duration(seconds: 5)); // Adjust the delay as needed
    }
    } else {
      // Handle the API error here
      print('Failed to fetch verification result. Status Code: ${response.statusCode}');
      print('Reason: ${response.reasonPhrase}');
      return null;
    }
  }

  return verificationResult;
}





