var shipStory = ["drops out of hyperspace next to a black hole","responds to a distress call", "tests a new warp drive component", "patrols the borders of the Neutral Zone","encounters the Borg","careens out of control","transports a diplomat from <em>Benzar</em>","suffers a power failure, causing it to drift into the neutral zone"];

var character = ["Data","Worf","Riker","Picard","Wesley","Dr Crusher","Deanna","Geordi"];

var characterHook = ["develops a love interest with","develops a new strategy to deal with","experiments with the undeniably dangerous aspects of","creates a new and improved version of","has a heart to heart with","tries to regain control of a wild experiment with","declares war on","cheats death by fooling","is trapped on a vessel controlled by","has a flashback recalling the time spent with"];

var characterElement = ["the Borg","the Klingons","Riker's Beard","the ship's computer","the Romulans","Q", "Guinan","the crew of a <em>Starship Enterprise</em> from an alternate dimension"];

function nextGen()
{
  var writeShip = shipStory[Math.floor(Math.random()*shipStory.length)];
  var writeCharacter = character[Math.floor(Math.random()*character.length)];
  var writeHook = characterHook[Math.floor(Math.random()*characterHook.length)];
  var writeElement = characterElement[Math.floor(Math.random()*characterElement.length)];

document.getElementById("plot").innerHTML="The <em>Starship Enterprise</em> "+writeShip+" while "+writeCharacter+" "+writeHook+" "+writeElement+".";
}

