import 'package:flutter/material.dart';
import 'dart:math';

class ChatScreen extends StatefulWidget {
  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final List<String> messages = [];
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Care Chatbot'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true, // Reverse the list view to start from the bottom
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildMessage(messages[index]);
              },
            ),
          ),
          _buildMessageInputField(),
        ],
      ),
    );
  }

  Widget _buildMessage(String message) {
    final isUserMessage = message.startsWith('You:');
    final AssetImage userImage = AssetImage('assets/user.jpg');
    final AssetImage botImage = AssetImage('assets/bot.png');

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Row(
        mainAxisAlignment: isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          isUserMessage ? _buildUserAvatar(userImage) : _buildBotAvatar(botImage),
          SizedBox(width: 8.0),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: isUserMessage ? Colors.blue : Colors.green,
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: EdgeInsets.all(12.0),
              child: Text(
                message,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserAvatar(ImageProvider<Object> imageProvider) {
    return CircleAvatar(
      radius: 16,
      backgroundImage: imageProvider,
    );
  }

  Widget _buildBotAvatar(ImageProvider<Object> imageProvider) {
    return CircleAvatar(
      radius: 16,
      backgroundImage: imageProvider,
    );
  }

  Widget _buildMessageInputField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Type your message...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              _sendMessage(_textEditingController.text);
              _textEditingController.clear();
            },
          ),
        ],
      ),
    );
  }

  void _sendMessage(String message) {
    setState(() {
      messages.insert(0, "You: $message");

      // Apply logic to get bot response
      String botResponse = getResponse(message);
      messages.insert(0, "Bot: $botResponse");
    });
  }

  String getResponse(String message) {
    final intents = [
      {
        "tag": "greetings",
        "patterns": [
          "hi there",
          "hi dear",
          "hello",
          "haroo",
          "yaw",
          "wassup",
          "hi",
          "hey",
          "holla",
          "hello"
        ],
        "responses": [
          "hello thanks for checking in",
          "hi there, how can i help you"
        ],
        "context": [""]
      },
      {
        "tag": "goodbye",
        "patterns": ["bye", "good bye", "see you later"],
        "responses": ["have a nice time, welcome back again", "bye bye"],
        "context": [""]
      },
      {
        "tag": "thanks",
        "patterns": [
          "Thanks",
          "okay",
          "Thank you",
          "thankyou",
          "That's helpful",
          "Awesome",
          "thanks",
          "Thanks for helping me",
          "wow",
          "great"
        ],
        "responses": [
          "Happy to help!",
          "Any time!",
          "you're welcome",
          "My pleasure"
        ],
        "context": [""]
      },
      {
        "tag": "asthma",
        "patterns": [
          "asthma",
          "What is asthma?",
          "Tell me about asthma",
          "What are the symptoms of asthma?"
        ],
        "responses": [
          "Asthma is a chronic respiratory condition characterized by inflammation of the airways, leading to difficulty breathing.",
          "Common symptoms of asthma include wheezing, shortness of breath, coughing, and chest tightness."
        ],
        "context": [""]
      },
      {
        "tag": "diabetes",
        "patterns": [
          "diabetes",
          "What is diabetes?",
          "Tell me about diabetes",
          "What are the symptoms of diabetes?"
        ],
        "responses": [
          "Diabetes is a metabolic disorder characterized by high blood sugar levels due to either insufficient insulin production or ineffective use of insulin by the body.",
          "Symptoms of diabetes include frequent urination, increased thirst, unexplained weight loss, fatigue, and blurred vision."
        ],
        "context": [""]
      },
      {
        "tag": "hypertension",
        "patterns": [
          "hypertension",
          "What is hypertension?",
          "Tell me about hypertension",
          "What are the symptoms of hypertension?"
        ],
        "responses": [
          "Hypertension, or high blood pressure, is a condition where the force of blood against the artery walls is consistently too high.",
          "Hypertension often does not cause symptoms, but in severe cases, it may lead to headaches, shortness of breath, dizziness, and chest pain."
        ],
        "context": [""]
      },
      {
        "tag": "fever",
        "patterns": [
          "fever",
          "What causes fever?",
          "Tell me about fever",
          "What are the symptoms of fever?"
        ],
        "responses": [
          "Fever is a temporary increase in body temperature, often due to an illness or infection.",
          "Common symptoms of fever include high body temperature, chills, sweating, headache, muscle aches, and fatigue."
        ],
        "context": [""]
      },
      {
        "tag": "dengue",
        "patterns": [
          "dengue",
          "What is dengue?",
          "Tell me about dengue",
          "What are the symptoms of dengue?"
        ],
        "responses": [
          "Dengue is a mosquito-borne viral infection caused by the dengue virus.",
          "Symptoms of dengue include high fever, severe headache, pain behind the eyes, joint and muscle pain, fatigue, nausea, vomiting, and skin rash."
        ],
        "context": [""]
      },
      {
        "tag": "malaria",
        "patterns": [
          "malaria",
          "What is malaria?",
          "Tell me about malaria",
          "What are the symptoms of malaria?"
        ],
        "responses": [
          "Malaria is a mosquito-borne infectious disease caused by parasites of the Plasmodium genus.",
          "Symptoms of malaria include fever, chills, sweats, headache, nausea, vomiting, muscle pain, and fatigue."
        ],
        "context": [""]
      },
      {
        "tag": "flu",
        "patterns": [
          "flu",
          "What is the flu?",
          "Tell me about the flu",
          "What are the symptoms of the flu?"
        ],
        "responses": [
          "Influenza, commonly known as the flu, is a viral respiratory infection caused by influenza viruses.",
          "Symptoms of the flu include fever, cough, sore throat, runny or stuffy nose, body aches, headache, chills, and fatigue."
        ],
        "context": [""]
      },
      {
        "tag": "covid-19",
        "patterns": [
          "covid-19",
          "What is COVID-19?",
          "Tell me about COVID-19",
          "What are the symptoms of COVID-19?"
        ],
        "responses": [
          "COVID-19 is a respiratory illness caused by the novel coronavirus SARS-CoV-2.",
          "Symptoms of COVID-19 include fever or chills, cough, shortness of breath or difficulty breathing, fatigue, muscle or body aches, headache, new loss of taste or smell, sore throat, congestion or runny nose, nausea or vomiting, and diarrhea."
        ],
        "context": [""]
      },
      {
        "tag": "thyroid",
        "patterns": [
          "thyroid",
          "What is thyroid disease?",
          "Tell me about thyroid disease",
          "What are the symptoms of thyroid disease?"
        ],
        "responses": [
          "Thyroid disease refers to a variety of conditions that affect the thyroid gland, a small butterfly-shaped gland located in the front of the neck.",
          "Symptoms of thyroid disease can vary depending on whether the thyroid gland is overactive (hyperthyroidism) or underactive (hypothyroidism), but may include fatigue, weight changes, hair loss, mood changes, and difficulty regulating body temperature."
        ],
        "context": [""]
      },
      {
        "tag": "plague",
        "patterns": [
          "plague",
          "What is the plague?",
          "Tell me about the plague",
          "What are the symptoms of the plague?"
        ],
        "responses": [
          "The plague is a severe infectious disease caused by the bacterium Yersinia pestis.",
          "Symptoms of the plague may include fever, chills, weakness, rapid heartbeat, nausea, vomiting, abdominal pain, and swollen and painful lymph nodes (buboes)."
        ],
        "context": [""]
      },
      {
        "tag": "rabies",
        "patterns": [
          "rabies",
          "What is rabies?",
          "Tell me about rabies",
          "What are the symptoms of rabies?"
        ],
        "responses": [
          "Rabies is a viral disease that affects the nervous system of mammals, usually transmitted through the bite of an infected animal.",
          "Symptoms of rabies in humans may initially include fever, headache, and weakness, followed by confusion, anxiety, hallucinations, excessive salivation, difficulty swallowing, and fear of water (hydrophobia). Without prompt treatment, rabies is almost always fatal."
        ],
        "context": [""]
      },
      {
        "tag": "typhoid",
        "patterns": [
          "typhoid",
          "What is typhoid fever?",
          "Tell me about typhoid fever",
          "What are the symptoms of typhoid fever?"
        ],
        "responses": [
          "Typhoid fever is a bacterial infection caused by Salmonella typhi bacteria.",
          "Symptoms of typhoid fever include sustained fever as high as 103-104°F (39-40°C), weakness, stomach pain, headache, loss of appetite, and rash. Without treatment, typhoid fever can lead to serious complications."
        ],
        "context": [""]
      },
      {
        "tag": "yellow-fever",
        "patterns": [
          "yellow fever",
          "What is yellow fever?",
          "Tell me about yellow fever",
          "What are the symptoms of yellow fever?"
        ],
        "responses": [
          "Yellow fever is a viral disease transmitted by infected mosquitoes.",
          "Symptoms of yellow fever include fever, headache, muscle pain, backache, loss of appetite, nausea, vomiting, and jaundice (yellowing of the skin and eyes). In severe cases, yellow fever can lead to liver and kidney failure, bleeding disorders, and death."
        ],
        "context": [""]
      }
    ];

    final cleanedMessage = message.toLowerCase();

    for (final intent in intents) {
      final patterns = intent['patterns'] as List<String>?;

      if (patterns != null) {
        for (final pattern in patterns) {
          if (cleanedMessage.contains(pattern.toLowerCase())) {
            final responses = intent['responses'] as List<String>?;

            if (responses != null && responses.isNotEmpty) {
              if (intent['tag'] == 'asthma') {
                return responses[Random().nextInt(responses.length)] +
                    "\nPrevention measures for Asthma: Avoiding triggers such as tobacco smoke, air pollution, and allergens, maintaining a healthy weight, and following a treatment plan prescribed by a healthcare professional.";
              } else if (intent['tag'] == 'diabetes') {
                return responses[Random().nextInt(responses.length)] +
                    "\nPrevention measures for Diabetes: Maintaining a healthy diet, engaging in regular physical activity, maintaining a healthy weight, and avoiding excessive alcohol consumption.";
              } else if (intent['tag'] == 'hypertension') {
                return responses[Random().nextInt(responses.length)] +
                    "\nPrevention measures for Hypertension: Engage in regular physical activity, aiming for at least 30 minutes most days of the week.Limit alcohol intake.";
              } else if (intent['tag'] == 'fever') {
                return responses[Random().nextInt(responses.length)] +
                    "\nPrevention measures for Fever: Ensure vaccinations are up-to-date to prevent illnesses that may cause fever, such as influenza or measles.Avoid close contact with individuals who are sick.";
              } else if (intent['tag'] == 'dengue') {
                return responses[Random().nextInt(responses.length)] +
                    "\nPrevention measures for Dengue: Eliminate standing water around your home to prevent mosquito breeding grounds.";
              } else if (intent['tag'] == 'malaria') {
                return responses[Random().nextInt(responses.length)] +
                    "\nPrevention measures for Malaria: Sleep under insecticide-treated mosquito nets, especially in high-risk areas.";
              } else if (intent['tag'] == 'flu') {
                return responses[Random().nextInt(responses.length)] +
                    "\nPrevention measures for Flu: Get an annual flu vaccination to reduce your risk of contracting the flu virus.";
              } else if (intent['tag'] == 'covid-19') {
                return responses[Random().nextInt(responses.length)] +
                    "\nPrevention measures for COVID-19: Practice good hand hygiene by washing hands frequently with soap and water or using hand sanitizer with at least 60% alcohol content.";
              } else if (intent['tag'] == 'thyroid') {
                return responses[Random().nextInt(responses.length)] +
                    "\nPrevention measures for Thyroid: Regularly monitor thyroid function through blood tests and consult a healthcare provider if you notice any symptoms of thyroid dysfunction.";
              } else if (intent['tag'] == 'plague') {
                return responses[Random().nextInt(responses.length)] +
                    "\nPrevention measures for Plague: Avoid direct contact with wild rodents and their fleas, especially in areas where plague is endemic.";
              } else if (intent['tag'] == 'rabies') {
                return responses[Random().nextInt(responses.length)] +
                    "\nPrevention measures for Rabies: Vaccinate pets against rabies and avoid contact with stray animals. Seek medical attention immediately if bitten or scratched by an animal.";
              } else if (intent['tag'] == 'typhoid') {
                return responses[Random().nextInt(responses.length)] +
                    "\nPrevention measures for Typhoid: Practice good hygiene, including washing hands before eating and after using the toilet, and consuming safe, clean drinking water and food.";
              } else if (intent['tag'] == 'yellow-fever') {
                return responses[Random().nextInt(responses.length)] +
                    "\nPrevention measures for Yellow fever: Get vaccinated against yellow fever before traveling to areas where the disease is endemic.";
              } 

              return responses[Random().nextInt(responses.length)];
            }
          }
        }
      }
    }

    // If no match is found, return a default response
    return "I'm sorry, I didn't understand that. Can you please rephrase?";
  }
}
