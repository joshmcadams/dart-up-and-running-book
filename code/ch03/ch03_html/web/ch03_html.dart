import 'dart:html';
import 'dart:svg';

void main() {
  findElements();
  replaceElement();
  displayConditionally();
  setAttribute();
  createElements();
  funWithNodes();
  funWithCss();
  handleEvents();
}

void DELETEME(Event event) {
  var text = query("#sample_text_id").text;
  var buffer = new StringBuffer();
  for (int i = text.length - 1; i >= 0; i--) {
    buffer.write(text[i]);
  }
  query("#sample_text_id").text = buffer.toString();
}

void findElements() {
  Element elem1 = query('#an-id');           // Find an element by id (an-id).
  Element elem2 = query('.a-class');         // Find an element by class (a-class).
  List<Element> elems1 = queryAll('div');    // Find all elements by tag (<div>).
  List<Element> elems2 = queryAll('input[type="text"]'); // Find all text inputs.

  // Find all elements with the CSS class 'find-me' inside of a <p>
  // that is inside an element with the ID 'look-here'.
  List<Element> elems3 = queryAll('#id p.class');
}

void replaceElement() {
  AElement aElement = query('#example');
  //XX: PENDING, href has no setter anymore.
  //aElement.href = 'http://dartlang.org';
}

void displayConditionally() {
  // In Dart:
  final osList = ['mac', 'win', 'linux'];

  var userOs = 'linux'; // In real code you'd programmatically determine this.

  for (var os in osList) {            // For each possible OS...
    bool shouldShow = (os == userOs); // Does this OS match the user's OS?
    for (var elem in queryAll('.$os')) { // Find all elements for this OS.
      elem.hidden = !shouldShow;      // Show or hide each element.
    }
  }
}

void setAttribute() {
  Element elem = query('#shy');
  
  // Set a non-existent attribute. No error checking/complaints!
  elem.attributes['someAttribute'] = 'someValue';

  elem.attributes['hidden'] = 'true';
  // elem.hidden = true;  // BETTER!
}


void createElements() {
  var elem = new ParagraphElement();
  elem.text = 'Creating is easy!';
  document.body.children.add(elem);
  
  var elem2 = new Element.html('<p>Creating <em>is</em> easy!</p>');  
  document.body.children.add(elem2);
}

void funWithNodes() {
  var elem = new Element.html('<p>Some <b>styled</b> text.</p>');
  
  // Find the parent by ID, and add elem as its last child.
  query('#inputs').nodes.add(elem);
  
  // Find a node by ID, and replace it in the DOM.
  query('#status').replaceWith(elem);
  
  // Find a node by ID, and remove it from the DOM.
  query('#expendable').remove();
}

void funWithCss() {
  var element = query('#message');
  element.classes.add('warning');
//  
//  var message = new DivElement();
//  message.id = 'message2';
//  message.text = 'Please subscribe to the Dart mailing list.';
  
  var message = new DivElement()
  ..id = 'message2'
  ..text = 'Please subscribe to the Dart mailing list.';
  
  message.style
  ..fontWeight = 'bold'
  ..fontSize = '2em';
  
  query("#fun-with-css").children.add(message);
}

void handleEvents() {
  // Find a button by ID and add an event handler.
  query('#submitInfo').onClick.listen((e) {
    // When the button is clicked, it runs this code.
    submitData();
  });
  
  document.body.onClick.listen((e) {
    var clickedElem = e.target;
    print('You clicked the ${clickedElem.id} element.');
//    // If you don't want blanks in the output, use this code instead:    
//    var name = clickedElem.id;
//    if (name == '') name = '<unnamed>';
//    print('You clicked the $name element.');
  });
}

void submitData() {
  print("data submitted");
}
