# Device-Agnostic Design Course Project I

Name of the application

- Quiz

Applications displaying practice topics as well as a general practice option. The user can select the topic and answer the questions by choosing from the answers provided. After answering, the user will see a feedback screen about the correctness or incorrectness of the answer. If answer is incorrect, the user can continue and select another option. 
General practice allows practice questions with less correct answers.

#3 key challenges faced during the project

- Rendering the list of objects returning from back-end and displaying it in widget.
- Undestanding how to correctly use shared preferences in provider
- How to display a scrollbar
- go_router issue when running tests and try to access current URL 'The parent route must be a page route to have a GoRouterState'

#3 key learning moments from working on the project

- How to update state in Riverpod
- how to send data between widgets from child to parent
- how to use Nock, mock POST, SharedPreferences in tests

#4 list of dependencies and their versions

- dependencies:
  cupertino_icons: 1.0.5
  flutter_riverpod: 2.3.6
  go_router: 6.5.9
  http: 0.13.6
  riverpod: 2.3.6
  shared_preferences: 2.2.0

- dev_dependencies:
  flutter_lints: 2.0.1
  nock: 1.2.3
